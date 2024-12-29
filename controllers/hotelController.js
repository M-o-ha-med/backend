const db = require('../config/db');

exports.getHotels = (req, res) => {
    db.con.query("SELECT * from Hotels" , (err,data) => {
	if (err) console.log(err)
	res.json(data);
})	
};

exports.getHotelsFromSearchBar = (req,res) => {
	const {query} = req.params.query;
	
	if (!query) {
    return res.status(400).json({ error: "Query parameter is required" });
	}
	
	console.log('Query received from frontend:', query);
	
	db.con.query("SELECT * FROM hotels WHERE namaHotel = ?",[query],(err,data)=>{
		if(err) console.log(err);
		res.json(data);
	})
};


exports.getHotelDetails = (req, res) => {
	db.con.query("SELECT * from Hotels WHERE hotelID = (?) limit 1" , [req.params.id] , (err,data) => {
		if (err) console.log(err);
		res.json(data);
})	
};