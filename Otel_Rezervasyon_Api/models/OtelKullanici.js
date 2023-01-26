const mongoose = require('mongoose');

const OtelKullanici = mongoose.Schema({
    eposta: String,
    sifre: String,
    otel: { type: mongoose.SchemaTypes.ObjectId, ref: 'Otel' },
})

module.exports = mongoose.model('OtelKullanici', OtelKullanici);