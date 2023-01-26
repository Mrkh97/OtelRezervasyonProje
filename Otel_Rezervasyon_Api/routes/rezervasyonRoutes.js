const express = require('express');

const Rezervasyon = require('../models/Rezervasyon');
const Otel = require('../models/Otel');
const Kullanici = require('../models/Kullanici');

const router = express.Router();


router.post('/addRezervasyon', async (req, res) => {
    const dbRes = await Rezervasyon.create(req.body);
    const dbRes2 = await Otel.findById(req.body.otel);
    dbRes2.rezervasyonlar.push(dbRes.id);
    await Otel.findByIdAndUpdate(req.body.otel, dbRes2);
    const dbRes3 = await Kullanici.findById(req.body.kullanici);
    dbRes3.rezervasyon_list.push(dbRes.id);
    await Kullanici.findByIdAndUpdate(req.body.kullanici, dbRes3);
    res.send({ 'durum': true });
})

router.post('/getRezervasyonListOtel', async (req, res) => {
    const dbRes = await Rezervasyon.find({ otel: req.body.otel }).sort({ 'date_created_at': -1 }).populate(['otel', 'kullanici']);
    // console.log(dbRes);
    res.send({ 'durum': true, 'data': dbRes });
})

router.post('/getRezervasyonListKullanici', async (req, res) => {
    const dbRes = await Rezervasyon.find({ kullanici: req.body.kullanici }).sort({ 'date_created_at': -1 }).populate(['otel', 'kullanici']);
    // console.log(dbRes[0]);
    res.send({ 'durum': true, 'data': dbRes });
})


module.exports = router;