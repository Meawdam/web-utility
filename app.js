const express = require("express");
const path = require("path");
const bcrypt = require("bcrypt");
const session = require("express-session");
const memoryStore = require("memorystore")(session);

const app = express();
const con = require("./db");
// const upload = require('./upload');

app.use("/public", express.static(path.join(__dirname, "public")));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(
  session({
    cookie: { maxAge: 24 * 60 * 60 * 1000 },
    secret: "Webis2easy4us",
    resave: false,
    saveUninitialized: true,
    store: new memoryStore({
      checkPeriod: 24 * 60 * 60 * 1000, // prune expired entries every 24h
    }),
  })
);

//============================ Admin routes ============================
// add new product
app.post("/admin/product", (req, res,) => {
  if(req.session.role !== 1){
    return res.status(403).send('Unaurthorized');
  }

  upload.single('image')(req, res, (uploadErr)=>{
    const {productName, productPrice, productAmount} = req.body;
    const sql = 'INSERT INTO product(name, price, amount, image) VALUE(?, ?, ?, ?)';
    con.query(sql. [productName, productPrice, productAmount, req.file.filename], (err, result) => {
        if(err){
            console.error(err);
            return res.status(500).send('Upload failed');
        }
        if(result.affectedRows !== 1){
            return res.status(500).send('Upload failed')
        }
        res.send('Upload done!')
    });
  });
});

//============================ Common routes ============================
// get all products
app.get("/product", function (req, res) {
  if (!req.session.userID) {
    return res.status(403).send("Forbidden!");
  }
  const sql = "SELECT * FROM product";
  con.query(sql, function (err, result) {
    if (err) {
      return res.status(500).send("Database server error!");
    }
    // add user data with product
    res.json({
      user: [req.session.id, req.session.username, req.session.role],
      products: result,
    });
  });
});

// generate hashed password
app.get("/password/:pass", function (req, res) {
  const password = req.params.pass;
  const saltRounds = 10;
  bcrypt.hash(password, saltRounds, function (err, hash) {
    if (err) {
      return res.status(500).send("Hashing error!");
    }
    res.send(hash);
  });
});

// login
app.post("/login", (req, res) => {
  setTimeout(() => {
    const { username, password } = req.body;
    const sql = "SELECT * FROM user WHERE username = ?";
    con.query(sql, [username], function (err, result) {
      if (err) {
        return res.status(500).send("Database server error!");
      }
      if (result.length == 0) {
        return res.status(400).send("Wrong username!");
      }
      bcrypt.compare(password, result[0].password, function (err, same) {
        if (err) {
          return res.status(500).send("Hashing error!");
        }
        if (!same) {
          return res.status(401).send("Wrong password!");
        }
        // keep session
        req.session.userID = result[0].id;
        req.session.username = result[0].username;
        req.session.role = result[0].role;
        if (result[0].role == 1) {
          res.send("/admin/product");
        } else {
          res.send("/user/product");
        }
      });
    });
  }, 1000);
});

//logout
app.get("/logout", (req, res) => {
  req.session.destroy(function (err) {
    if (err) {
      return res.status(500).send("Logout error!");
    }
    res.redirect("/");
  });
});

//============================ Page routes ============================
// admin product page
app.get("/admin/product", (req, res) => {
  if (req.session.role != 1) {
    return res.redirect("/");
  }
  res.sendFile(path.join(__dirname, "views/admin/product.html"));
});

// user product page
app.get("/user/product", (req, res) => {
  if (req.session.role != 2) {
    return res.redirect("/");
  }
  res.sendFile(path.join(__dirname, "views/user/product.html"));
});

// root service
app.get("/", (req, res) => {
  if (req.session.role === 1) {
    return res.redirect("/admin/product");
  } else if (req.session.role === 2) {
    return res.redirect("/user/product");
  }
  res.sendFile(path.join(__dirname, "views/login.html"));
});

//============================ Starting server ============================
const port = 3000;
app.listen(port, function () {
  console.log("Server is ready at " + port);
});
