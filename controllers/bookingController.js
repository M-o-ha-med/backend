const db = require('../config/db');

//create booking for user
exports.createBooking =async  (req, res) => {
	const {hotelID,bookingDate,dayOfreservation,userID} = req.body;
	const addBooking = await new Promise((resolve,reject) => {
		db.con.query("INSERT INTO bookings(hotelID,bookingDate,dayOfreservation,userID) VALUES (?,?,?,?)",[hotelID,bookingDate,dayOfreservation,userID] , (err,data) => {
		if (err) return reject(err);
		resolve(data);
		});
	});
	
    res.status(201).json({ message: "Booking created successfully", data: req.body });
};

//confirm users booking
exports.confirmBooking = (req, res) => {
	const bookingID = req.params.id;
	console.log(req.params.id);
	db.con.query("UPDATE bookings SET isConfirmed=1 WHERE bookingID=?",[bookingID],(err,data)=>{
		if(err) console.log(err);
		
	});
    res.json({ message: "Booking confirmed successfully", bookingId: req.params.id });
};

//read user's booking
exports.getBooking = async (req, res) => {

		    db.con.query("SELECT b.userID, b.bookingID, h.namaHotel, b.isConfirmed FROM bookings b JOIN hotels h ON h.hotelID = b.hotelID;" , (err,data) => {
			if (err) console.log(err)
			res.json(data);
			})
	
	
};

exports.getUserBookings = async (req,res) => {
	db.con.query("SELECT b.userID, b.bookingID, h.namaHotel, b.isConfirmed FROM bookings b JOIN hotels h ON h.hotelID = b.hotelID WHERE b.userID = ?" , [req.user.userID], (err,data) => {
	if (err) console.log(err)
	res.json(data);
})
};

//read specific user's booking
exports.getBookingDetails = async (req, res) => {
	db.con.query("SELECT * from bookings WHERE bookingID = (?)" , [req.params.id] , (err,data) => {
		if (err) console.log(err);
		res.json(data);
})	
};

exports.updateBooking= async (req,res) => {
	const {userID,bookingDate,isConfirmed} = req.body;
	const bookingID = req.params.id;
	try{
		const update =await new Promise((resolve,reject)=>{ 
		db.con.query("UPDATE bookings SET updated_at=CURRENT_TIMESTAMP, offerID=(?), userID=(?), isConfirmed=(?) , bookingDate=(?) WHERE bookingID = (?)" , 
		[offerID,userID,bookingDate,isConfirmed,bookingID],(err,data) =>{
			if (err) return reject(err);
			if (data.affectedRows == 0) return reject(new Error('Failed to update booking record'));
			resolve();
		});
	  });
	  
		return res.status(201).json({ message: 'booking updated successfully' });
	}
	
	catch(error){
		return res.status(500).json({ error : error.message});
	}
};


//delete booking by user
exports.deleteBookingByUser = async (req, res) => {
    try {
        const booking = await Booking.findByIdAndDelete(req.params.id);
        if (!booking) {
            return res.status(404).json({ message: 'Booking not found' });
        }
        res.status(200).json({ message: 'Booking deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Menghapus booking oleh admin
exports.deleteBookingByAdmin = async (req, res) => {
	const bookingID = req.params.id;
    try {
        const booking = await new Promise((resolve,reject) => {
			db.con.query("DELETE FROM bookings WHERE bookingID = ?",[bookingID],(err,data)=>
			{
				if (err) return reject(err);
				if (data.affectedRows == 0) return reject(new Error('Failed to delete booking record'));
				resolve();
			});
		});
        res.status(200).json({ message: 'Booking deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};