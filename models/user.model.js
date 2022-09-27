const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const newSchema=new Schema({
    email:{
        type:String,
        required:true
    },
    password:{
        type:String,
        required:true
    }
});

module.exports = User= mongoose.model('User', newSchema);