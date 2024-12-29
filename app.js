const express = require('express');
const hotelRoutes = require('./routes/hotel');
const userRoutes = require('./routes/user');
const bookingRoutes = require('./routes/booking');
const adminRoutes = require('./routes/admin');
const offerRoutes = require('./routes/offer');
const db = require('./config/db');
const app = express();
const path = require('path');


require('dotenv').config()
// Middleware
app.use(express.json());
app.use('/Images', express.static(path.join(__dirname, 'Images')));
app.use(cors(corsOptions));

// Routes
app.use('/api/hotel', hotelRoutes);
app.use('/api/users', userRoutes);
app.use('/api/bookings', bookingRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/offers', offerRoutes);


// Start Server
const PORT = 3000;

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
