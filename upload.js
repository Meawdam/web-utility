const multer = require('multer');

// configure multer
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img');
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + "_" + file.originalname);
    }
});

const upload = multer({storage: storage});

module.exports = upload;