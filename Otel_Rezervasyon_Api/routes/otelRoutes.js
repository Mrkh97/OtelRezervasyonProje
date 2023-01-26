const express = require('express');

const Otel = require('../models/Otel');
const Kullanici = require('../models/Kullanici');

const router = express.Router();

router.post('/updateOtel', async (req, res) => {
    console.log(req.body);
    const dbRes = await Otel.findById(req.body._id).update(req.body);
    console.log(dbRes);
    res.send({ 'durum': true });
    // try {
    //     await Otel.create(data);
    //     return res.send({ durum: true, mesaj: 'Otel Oluşturuldu' })
    // } catch (error) {
    //     return res.send(error)
    // }
})

router.post('/getOtel', async (req, res) => {
    console.log(req.body.otel);
    const response = await Otel.findById(req.body.otel);
    // console.log(response);
    res.send({ 'durum': true, 'data': response });
})

router.post('/getOtelList', async (req, res) => {
    res.send(await Otel.find(req.body.search).sort(req.body.sort));
})

router.post('/getFavoriList', async (req, res) => {
    const dbRes = await Kullanici.findById(req.body.kullanici).populate('favori_list');
    res.send({ 'durum': true, 'data': dbRes.favori_list });
})

router.post('/addFavori', async (req, res) => {
    const dbRes = await Kullanici.findById(req.body.kullanici);
    dbRes.favori_list.push(req.body.otel);
    await Kullanici.findByIdAndUpdate(req.body.kullanici, dbRes);
    res.send({ 'durum': true });
})

router.post('/removeFavori', async (req, res) => {
    const dbRes = await Kullanici.findById(req.body.kullanici);
    const index = dbRes.favori_list.indexOf(req.body.otel);
    let newFavoriler = dbRes.favori_list;
    newFavoriler.splice(index, 1);
    // console.log(dbRes);
    await Kullanici.findByIdAndUpdate(req.body.kullanici, { 'favori_list': newFavoriler });
    res.send({ 'durum': true });
})

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





module.exports = router;