const express = require('express');
const hotelRoutes = require('./routes/hotel');
const userRoutes = require('./routes/user');
const bookingRoutes = require('./routes/booking');
const adminRoutes = require('./routes/admin');

const app = express();
const path = require('path');

const cors  = require('cors');
const corsOptions = {
	origin :["https://bobohotel.netlify.app"],
	methods: 'GET,POST,PATCH,DELETE',            // Allow only GET and POST methods
    allowedHeaders: ['Content-Type','Authorization'], // Allow specific headers
    credentials: true   
};

app.use(cors(corsOptions));
require('dotenv').config()
// Middleware
app.use(express.json());



// Routes
app.use('/api/hotel', hotelRoutes);
app.use('/api/users', userRoutes);
app.use('/api/bookings', bookingRoutes);
app.use('/api/admin', adminRoutes);



// Start Server
const PORT = 3000;

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
