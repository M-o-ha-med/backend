const multer = require('multer');
const path = require('path');
const ImageKit = require('imagekit');

const imagekit = new ImageKit({
    publicKey: "public_/xWguRgr/lqXza2RBwcyfjamiDA=",
    privateKey: "private_a5QlIcpUFcUC8bXkAwKlJPTkQPs=",
    urlEndpoint: "https://ik.imagekit.io/lfdf7rfwx/",
});


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

const imageKitStorage = {
    _handleFile(req, file, cb) {
        const chunks = [];

        // Collect the file stream into a buffer
        file.stream.on('data', (chunk) => {
            chunks.push(chunk);
        });

        file.stream.on('end', () => {
            const fileBuffer = Buffer.concat(chunks);

            // Upload to ImageKit
            imagekit.upload(
                {
                    file: fileBuffer, // File as a Buffer
                    fileName: `${Date.now()}-${file.originalname}`, // Unique file name
                },
                (err, result) => {
                    if (err) {
                        return cb(err);
                    }

                    cb(null, {
                        path: result.url,
                        filename: result.name,
                    });
                }
            );
        });

        file.stream.on('error', (err) => cb(err));
    },

    _removeFile(req, file, cb) {
        // Optional: Implement file removal logic if needed
        cb(null);
    },
};

// Setup multer with the custom storage engine
const upload = multer({
    storage: imageKitStorage,
    fileFilter: fileFilter,
    limits: {
        fileSize: 20 * 1024 * 1024, // Limit to 20MB
    },
});

module.exports = upload;
