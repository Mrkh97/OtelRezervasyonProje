const express = require('express')
const Kullanici = require('../models/Kullanici');

const router = express.Router();


router.post('/login', async (req, res) => {
    let data = req.body;
    try {
        let result = await Kullanici.find({ eposta: data.eposta });
        if (result.length == 0) {
            return res.send({
                durum: false,
                data: 'Kullanici Adı ve ya Şifre Yanlış'
            });
        }
        if (result[0].sifre == data.sifre) {
            return res.send({
                durum: true,
                data: result[0]
            });
        }
    } catch (error) {
        res.send(error);
    }
})

router.post('/updateName', async (req, res) => {
    console.log(req.body)
    const dbRes = await Kullanici.findByIdAndUpdate(req.body.kullaniciId, { 'ad': req.body.ad }, {
        new: true
    });
    console.log(dbRes);
    res.send({ 'durum': true, 'data': dbRes });
})

router.post('/signup', async (req, res) => {
    let data = req.body;
    console.log(data);
    try {
        const dbRes = await Kullanici.find().where({ 'eposta': req.body.eposta });
        if (dbRes.length !== 0) {
            return res.send({ 'durum': false, 'error': 'Bu Epostaile Daha Önce Kullanici Oluşturulmuştur' })
        }
        else {
            const dbRes2 = await Kullanici.create(data);
            res.send({ 'durum': true, 'data': dbRes2 });

        }
    } catch (error) {
        res.send(error);
    }
})

module.exports = router;