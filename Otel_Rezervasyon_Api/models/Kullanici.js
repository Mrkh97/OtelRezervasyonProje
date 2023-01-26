const mongoose = require('mongoose');

const kullaniciSchema = new mongoose.Schema({
    ad: String,
    soyadi: String,
    eposta: { type: String, required: true, unique: true },
    sifre: { type: String, required: true },
    rezervasyon_list: { type: [mongoose.SchemaTypes.ObjectId], ref: 'Rezervasyon' },
    favori_list: { type: [mongoose.SchemaTypes.ObjectId], ref: 'Otel' },
    dosya_src: String,
})

module.exports = mongoose.model('Kullanici', kullaniciSchema);