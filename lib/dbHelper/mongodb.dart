//mongodb connection
import 'package:innhacks/dbHelper/MongoDbModel.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:innhacks/dbHelper/constants.dart';
import 'package:flutter/material.dart';

class MongoDatabase {
  static var db, studentCollection, volunteerCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    studentCollection = db.collection(STUDENT_COLLECTION);
    volunteerCollection = db.collection(VOLUNTEER_COLLECTION);
  }

  static Future<String> insertStudent(StudentDbModel data) async {
    try {
      var result = await studentCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return result.toString();
      }
      else {
        return "Failed";
      }
    } catch (e) {
      return e.toString();
      print(e);
    }
  }

  static Future<String> insertVolunteer(VolunteerDbModel data) async {
    try {
      var result = await volunteerCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return result.toString();
      }
      else {
        return "Failed";
      }
    } catch (e) {
      return e.toString();
      print(e);
    }
  }
}