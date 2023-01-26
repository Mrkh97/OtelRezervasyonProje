const mongoose = require('mongoose');

const OtelSchema = new mongoose.Schema({
    adi: String,
    adres: String,
    aciklama: String,
    wifi: { type: Boolean, default: false },
    kahvalti: { type: Boolean, default: false },
    park_yeri: { type: Boolean, default: false },
    favori_sayisi: { type: Number, default: 0 },
    il: String,
    fiyat: Number,
    fotograflar: [String],
    rezervasyonlar: { type: [mongoose.SchemaTypes.ObjectId], ref: 'Rezervasyon' },

})

module.exports = mongoose.model('Otel', OtelSchema);