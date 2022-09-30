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
    },role:{
        type: String,
        default:'student',
        enum:['student','volunteer','admin']
    },
    username: {
        type: String,
        require: true
    },
});

module.exports = User= mongoose.model('user', newSchema);