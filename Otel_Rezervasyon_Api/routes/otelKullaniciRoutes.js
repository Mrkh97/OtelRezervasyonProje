const express = require('express');
const OtelKullanici = require('../models/OtelKullanici');
const Otel = require('../models/Otel');

const router = express.Router();

router.post('/addOtelKullanici', async (req, res) => {
    try {
        console.log(req.body);
        const dbRes = await OtelKullanici.find().where({ 'eposta': req.body.eposta });
        if (dbRes.length !== 0) {
            return res.send({ 'durum': false, 'error': 'Bu Epostaile Daha Önce Kullanici Oluşturulmuştur' })
        }
        const dbRes2 = await Otel.create({ 'adi': req.body.otelAdi });
        const dbRes3 = await OtelKullanici.create({ 'eposta': req.body.eposta, 'sifre': req.body.sifre, 'otel': dbRes2._id });
        res.send({ 'durum': true, 'data': dbRes3 });
    } catch (error) {
        console.log(error)
        res.send({ 'durum': false, 'error': error });
    }
})

router.post('/getOtelKullanici', async (req, res) => {
    try {
        const dbRes = await OtelKullanici.find().where('eposta').equals(req.body.eposta).populate("otel");
        console.log(dbRes);
        if (dbRes[0].sifre == req.body.sifre) {
            res.send({ 'durum': true, 'data': dbRes[0] });
        }
        else {
            res.send({ 'durum': false, 'error': 'şifre yanlış' })
        }

    } catch (error) {
        res.send({ 'durum': false, 'error': error });
    }
})

module.exports = router;