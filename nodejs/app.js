var express = require('express')
var app = express()

const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL });

const product = 'Fake Product'

app.get('/', function (req, res) {
    res.send(`Hello ${product}`)
})

pool.query('SELECT true as value', (err, result) => {
    if (err) {
        return console.error('Error connecting to database', err.stack)
    }
    console.log(`db connection works: ${result.rows[0].value}`)
})

app.listen(8080, function () {
    console.log('app started on http://localhost:8080/')
})