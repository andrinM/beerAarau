// --- Basic Setup ---
const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// --- Middleware ---
app.use(cors());
app.use(express.json());

// --- Database Connection ---
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// --- API ROUTES ---

/**
 * @api {get} /api/beers
 * @description Fetches a list of all beers from the 'beers' table.
 */
app.get('/api/beers', async (req, res) => {
    try {
        // The query is now very simple: just get everything from the beers table.
        const query = 'SELECT * FROM beers ORDER BY name ASC';
        const [beers] = await pool.query(query);
        
        // Send the results back as a JSON response
        res.json(beers);

    } catch (error) {
        console.error('Failed to fetch beers:', error);
        res.status(500).json({ message: 'Error fetching data from the database.' });
    }
});


// --- Start Server ---
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
    // Optional: Test DB connection on startup
    pool.getConnection()
        .then(connection => {
            console.log('Successfully connected to the database.');
            connection.release();
        })
        .catch(err => {
            console.error('ERROR connecting to the database:', err.stack);
        });
});