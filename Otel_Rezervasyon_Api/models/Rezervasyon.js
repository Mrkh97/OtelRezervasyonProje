const mongoose = require('mongoose');

const RezervasyonSchema = new mongoose.Schema({
    giris_tarihi: Date,
    cikis_tarihi: Date,
    toplam_fiyat: Number,
    bekleyen: Boolean,
    date_created_at: Date,
    otel: { type: mongoose.SchemaTypes.ObjectId, ref: "Otel" },
    kullanici: { type: mongoose.SchemaTypes.ObjectId, ref: "Kullanici" }
})

module.exports = mongoose.model('Rezervasyon', RezervasyonSchema);