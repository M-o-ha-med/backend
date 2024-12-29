const express = require('express');
const { authenticateToken, isAdmin } = require('../middleware/authMiddleware');
const { addHotel, updateHotel, deleteHotel } = require('../controllers/adminController');
const upload = require('../config/imageUpload');
const router = express.Router();

router.post('/hotels', upload.single('photo'),authenticateToken, isAdmin, addHotel);
router.patch('/hotels/:id', upload.single('photo'), authenticateToken, isAdmin, updateHotel);
router.delete('/hotels/:id', authenticateToken, isAdmin, deleteHotel);

module.exports = router;
