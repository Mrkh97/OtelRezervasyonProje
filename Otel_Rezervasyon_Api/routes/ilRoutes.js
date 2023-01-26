const express = require('express');

const Il = require('../models/Il');

const router = express.Router();

router.get('/addIl', async (req, res) => {
    const dbRes = await Il.create({ 'il_kodu': '34', 'il_adi': 'istanbul' });
    console.log(dbRes);
    res.send({ 'durum': true });
})

router.get('/getIller', async (req, res) => {
    const dbRes = await Il.find();
    res.send({ 'durum': true, 'data': dbRes });

})

module.exports = router;