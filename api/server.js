const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = 8080;

// Create a PostgreSQL pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'food_order',
  password: '2003',
  port: 5432,
});

// Middleware to parse JSON bodies
app.use(express.json());

// Route to get all items
app.get('/items', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM items');
    const items = result.rows;
    client.release();
    res.json(items);
  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).send('Internal Server Error');
  }
});

// Start the server
app.listen(port, async () => {
  try {
    await pool.connect();
    console.log(`Connected to PostgreSQL database`);
    console.log(`Server is running on http://localhost:${port}`);
  } catch (err) {
    console.error('Error connecting to PostgreSQL database', err);
  }
});