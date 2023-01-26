const mongoose = require('mongoose');

const Il = mongoose.Schema({
    il_kodu: Number,
    il_adi: String,
})

module.exports = mongoose.model('Il', Il);