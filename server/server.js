require("dotenv").config();
const express = require("express");
const morgan = require("morgan");
const app = express();
const db = require("./db");
const cors = require("cors");
app.use(cors());
app.use(express.json());
//Mengambil data semua kamar
app.get("/api/v1/rooms", async (req, res) => {
  try {
    const results = await db.query(
      "SELECT penyewa.room_no, noktp, nama, asal FROM rooms NATURAL JOIN penyewa ORDER BY penyewa.room_no ASC"
    );
    res.status(200).json({
      status: "success",
      results: results.rows.length,
      data: {
        rooms: results.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

//Mengambil data salah satu kamar
app.get("/api/v1/rooms/:rooms_id", async (req, res) => {
  console.log(req.params.rooms_id);

  try {
    const results = await db.query(
      "SELECT * FROM rooms NATURAL JOIN penyewa WHERE room_no = $1",
      [req.params.rooms_id]
    );

    const hasil = await db.query("SELECT * FROM log_tamu WHERE room_no = $1", [
      req.params.rooms_id,
    ]);
    res.status(200).json({
      status: "success",
      data: {
        rooms: results.rows[0],
        tamu: hasil.rows,
      },
    });
  } catch (err) {}
});

// app.get("/api/v1/rooms/:rooms_id/tamu", async (req, res) => {
//   console.log(req.params.rooms_id);
//   try {
//     const results = await db.query(
//       "SELECT * FROM log_tamu WHERE room_no = $1",
//       [req.params.rooms_id]
//     );

//     res.status(200).json({
//       status: "success",
//       data: {
//         rooms: results.rows[0],
//       },
//     });
//   } catch (err) {}
// });

app.post("/api/v1/rooms/:rooms_id/tamu", async (req, res) => {
  try {
    const newTamu = await db.query(
      "INSERT INTO log_tamu(nama, room_no) VALUES ($1,$2) RETURNING *",
      [req.body.name, req.params.rooms_id]
    );

    res.status(201).json({
      status: "success",
      data: {
        tambahtamu: newTamu.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

//update data kamar
app.put("/api/v1/rooms/:rooms_id", async (req, res) => {
  try {
    const results = await db.query(
      "UPDATE penyewa SET noktp = $1,nama = $2,asal = $3 WHERE room_no = $4 RETURNING *",
      [req.body.noktp, req.body.nama, req.body.asal, req.params.rooms_id]
    );

    res.status(201).json({
      status: "success",
      data: {
        rooms_id: results.rows[0],
      },
    });
  } catch (err) {
    console.log(err);
  }
});

const port = process.env.PORT;

app.listen(port, () => {
  console.log(`Server is up and listening on port ${port}`);
});
