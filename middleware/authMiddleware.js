require('dotenv').config();
const jwt = require('jsonwebtoken');

exports.authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
	const token = authHeader && authHeader.split(' ')[1];
    if (!token) return res.status(401).json({ message: 'Access Denied' });

    try {
        const verified = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET , (err,user) =>{
			if(err) return res.status(403)
			req.user = user
			next();
		});
    } catch (err) {
        res.status(400).json({ message: 'Invalid Token' });
    }
};

exports.isAdmin = (req, res, next) => {
    if (req.user.Role !== "Admin") {
        return res.status(403).json({ message: 'Access forbidden: Admins only' });
    }
    next();
};
