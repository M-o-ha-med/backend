const multer = require('multer');
const path = require('path');

// Konfigurasi penyimpanan file



const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./Images"); // Folder tempat menyimpan file
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`); // Penamaan unik file
  },
});

// Filter tipe file
const fileFilter = (req, file, cb) => {
  const allowedTypes = /jpeg|jpg|png/;
  const extName = allowedTypes.test(path.extname(file.originalname).toLowerCase());
  const mimeType = allowedTypes.test(file.mimetype);

  if (extName && mimeType) {
    cb(null, true);
  } else {
    cb(new Error('Only images are allowed'), false);
  }
};

// Setup multer
const upload = multer({
  storage: storage,
  fileFilter: fileFilter,
  limits: {
    fileSize: 10 * 1024 * 1024, // Batas ukuran file 5MB
  },
});

module.exports = upload;
