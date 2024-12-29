const express = require('express');
const router = express.Router();
const { authenticateToken, isAdmin } = require('../middleware/authMiddleware');
const { getHotels, getHotelDetails , getHotelsFromSearchBar} = require('../controllers/hotelController');

router.get('/', getHotels);
router.get('/:id', authenticateToken, getHotelDetails);
router.get('/search',authenticateToken, getHotelsFromSearchBar);

module.exports = router;