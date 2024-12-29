const express = require('express');
const router = express.Router();

const { createBooking, confirmBooking , getBooking , deleteBookingByAdmin,getUserBookings } = require('../controllers/bookingController');
const { authenticateToken, isAdmin } = require('../middleware/authMiddleware');

router.post('/', authenticateToken, createBooking);
router.patch('/:id/confirm' ,authenticateToken, isAdmin, confirmBooking);
router.get('/',authenticateToken, isAdmin, getBooking);
router.get('/user' , authenticateToken, getUserBookings);
router.delete('/:id/delete',authenticateToken, isAdmin, deleteBookingByAdmin)
router.post('/', authenticateToken, createBooking);
router.patch('/:id/confirm', authenticateToken, isAdmin, confirmBooking);

module.exports = router;
