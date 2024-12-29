const db = require('../config/db');

// Menghapus Hotel oleh admin
exports.deleteHotel = async (req, res) => {
	const hotelID = req.params.id;
    try {
        const deleteHotel = await new Promise((resolve,reject)=>{
			db.con.query("DELETE FROM hotels WHERE hotelID = ?" , [hotelID] , (err,data) =>{
				if (err) return reject(err);
				if (data.affectedRows == 0) return reject(new Error('Failed to delete hotel from record'));
				resolve();
			});
		});
		return res.status(201).json({ message: 'Hotel record deleted successfully' });
        
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
};


//Menambahkan Hotel oleh Admin
exports.addHotel = async (req, res) => {
  const { namaHotel, deskripsi, regionID , alamatHotel } = req.body;
  const photo = req.file ? req.file.filename : null; // Nama file gambar

  try {
    const inputData = await new Promise((resolve, reject) => {
      db.con.query(
        'INSERT INTO hotels (namaHotel, deskripsi, regionID, photo,alamatHotel) VALUES (?, ?, ?, ?,?)',
        [namaHotel, deskripsi, regionID, photo,alamatHotel],
        (err, data) => {
          if (err) return reject(err);
          resolve(data);
        }
      );
    });

    res.status(201).json({ message: 'Hotel data inserted successfully', data: inputData });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


exports.updateHotel = async (req, res) => {
  const { namaHotel, deskripsi, regionID , alamatHotel } = req.body;
  const photo = req.file ? req.file.filename : null; // Nama file gambar
  const hotelID = req.params.id;

  try {
    const update = await new Promise((resolve, reject) => {
      db.con.query(
        'UPDATE hotels SET namaHotel = ?, deskripsi = ?, regionID = ?, photo = ? , alamatHotel= ? WHERE hotelID = ?',
        [namaHotel, deskripsi, regionID, photo,alamatHotel, hotelID],
        (err, data) => {
          if (err) return reject(err);
          if (data.affectedRows === 0) return reject(new Error('Failed to update hotel data'));
          resolve(data);
        }
      );
    });

    res.status(200).json({ message: 'Hotel data updated successfully', data: update });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
