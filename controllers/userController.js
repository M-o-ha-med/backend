require('dotenv').config();
const bcrypt = require('bcrypt');        // Mengimpor bcrypt untuk enkripsi password
const jwt = require('jsonwebtoken');     // Mengimpor jsonwebtoken untuk membuat token
const User = require('../models/user');  // Mengimpor model User
const db = require('../config/db');		 // Mengimpor database
const sessionStorage = require('sessionstorage');


// Function to register a new user
exports.registerUser = async (req, res) => {
    const { name, email, password } = req.body;

    // Validate input
    if (!name || !password || !email) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    try {
        // Check if the username already exists
        const existingUser = await new Promise((resolve, reject) => {
            db.con.query("SELECT userName FROM users WHERE userName = ?", [name], (err, data) => {
                if (err) return reject(err); // Reject the promise on error
                resolve(data); // Resolve with the query result
            });
        });

        if (existingUser.length > 0) {
            return res.status(400).json({ message: 'Username already exists' });
        }

        // Hash the password before storing it
        const hashedPassword = await bcrypt.hash(password, 12);

        // Insert the new user into the database
        await new Promise((resolve, reject) => {
            db.con.query(
                "INSERT INTO users (userName, userPassword, userEmail) VALUES (?, ?, ?)",
                [name, hashedPassword, email],
                (err, data) => {
                    if (err) return reject(err); // Reject the promise on error
                    resolve(data); // Resolve with the query result
                }
            );
        });

        // Respond with a success message
        res.status(201).json({ message: 'User registered successfully', data: { name, email } });

    } catch (err) {
        // Handle errors
        console.error('Error during registration:', err);
        res.status(500).json({ message: 'Internal server error' });
    }
};


// Fungsi untuk login pengguna
exports.loginUser = async (req, res) => {
    const { email, password } = req.body;

    // Validasi input (cek apakah email dan password ada)
    if (!email || !password) {
        return res.status(400).json({ message: 'email and password are required' });
    }

    try {
        // Cari user berdasarkan username di database
        const user = await new Promise((resolve,reject) => {
			db.con.query("SELECT userName,userEmail,userPassword,userID,Role FROM users WHERE userEmail = (?)" , [email] , (err,data) =>{
				if(err) return reject(err);
				resolve(data[0]);
			});
		}); 
		
		if(user.length == 0) return res.status(400).json({ message: 'Invalid email or password' });
		
		const hashedPassword = await bcrypt.hash(password, 12);
		 
        // Cek apakah password yang dimasukkan cocok dengan yang ada di database
        const validPassword = await new Promise((resolve,reject) => { 
				bcrypt.compare(password, user.userPassword , function (error , result){
				if (error) return reject(error)
				resolve(result)
			});
		});
		
		console.log(validPassword);
        if (!validPassword) {
            return res.status(400).json({ message: 'Invalid email or password' });
        }

        // Buat token JWT yang berisi id dan email user
        const access_token = jwt.sign({ userID: user.userID, email: user.userEmail , Role: user.Role}, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '1h' });
		
        // Kirimkan token dan respons sukses
        res.json({ message: 'Login successful', user:user.Role , token:access_token , id:user.userID} );

		
    } catch (err) {
        // Tangani error jika terjadi
        res.status(500).json({ message: err.message , code: "GYATT"});
    }
	
};



exports.getUserdetail = async (req,res) =>{
	const user = jwt.verify(token, 'SECRET_KEY');
};