const express = require('express');
const path = require('path');
const cors = require('cors')
const mongoose = require('mongoose');
const multer = require('multer');

const otelKullaniciRoutes = require('./routes/otelKullaniciRoutes');
const kullaniciRoutes = require('./routes/kullaniciRoutes');
const otelRoutes = require('./routes/otelRoutes');
const ilRoutes = require('./routes/ilRoutes');
const rezervasyonRoutes = require('./routes/rezervasyonRoutes')
const OtelKullanici = require('./models/OtelKullanici');
const Otel = require('./models/Otel');

const app = express();
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static('Images'));
mongoose.set('strictQuery', false);
mongoose.connect('mongodb://localhost:27017/OtelRezDB');
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'Images')
    },
    filename: async (req, file, cb) => {
        const fileName = Date.now() + path.extname(file.originalname);
        const result = await Otel.findById(req.body.otel);
        result.fotograflar.push(fileName);
        await Otel.findById(req.body.otel).updateOne(result);
        cb(null, fileName)
    }
});

const upload = multer({ storage: storage });

app.get('/', async (req, res) => {
    res.send({ status: "running" });
})

app.use('/OtelKullanici', otelKullaniciRoutes);
app.use('/Kullanici', kullaniciRoutes);
app.use('/Otel', otelRoutes);
app.use('/Il', ilRoutes);
app.use('/Rezervasyon', rezervasyonRoutes);

app.post('/getImg', async (req, res) => {
    res.sendFile(__dirname + '/Images/' + req.body.src);
})

app.post('/uploadImg', upload.array('image'), async (req, res) => {
    res.send({ 'durum': true });
});

app.post('/removeImg', async (req, res) => {
    const dbRes = await Otel.findById(req.body.otelId);
    const index = dbRes.fotograflar.indexOf(req.body.imgId);
    let newFotograflar = dbRes.fotograflar;
    newFotograflar.splice(index, 1);
    const dbRes2 = await Otel.findByIdAndUpdate(req.body.otelId, { 'fotograflar': newFotograflar }, {
        new: true
    });
    res.send({ 'durum': true, 'data': dbRes2 });
})

app.listen(8000, () => console.log('running server on port 8000'))