import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

StudentDbModel studentDbModelFromJson(String str) => StudentDbModel.fromJson(json.decode(str));

String studentDbModelToJson(StudentDbModel data) => json.encode(data.toJson());

VolunteerDbModel volunteerDbModelFromJson(String str) => VolunteerDbModel.fromJson(json.decode(str));

String volunteerDbModelToJson(VolunteerDbModel data) => json.encode(data.toJson());

class StudentDbModel {
  StudentDbModel({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.age,
    required this.dob,
    required this.stuClass,
    required this.mobile,
    required this.enrolmentDate,
    required this.guardian,
    required this.address,
  });
  ObjectId id;
  final String email;
  final String name;
  final String gender;
  final String age;
  final String dob;
  final String stuClass;
  final String mobile;
  final String enrolmentDate;
  final String guardian;
  final String address;

  factory StudentDbModel.fromJson(Map<String, dynamic> json) => StudentDbModel(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    gender: json["gender"],
    age: json["age"],
    dob: json["dob"],
    stuClass: json["class"],
    mobile: json["mobile"],
    enrolmentDate: json["enrolmentDate"],
    guardian: json["guardian"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "gender": gender,
    "age": age,
    "dob": dob,
    "class": stuClass,
    "mobile": mobile,
    "enrolmentDate": enrolmentDate,
    "guardian": guardian,
    "address": address,
  };
}


class VolunteerDbModel {
  VolunteerDbModel({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.age,
    required this.dob,
    required this.classAssigned,
    required this.mobile,
    required this.profession,
    required this.address,
  });

  ObjectId id;
  final String email;
  final String name;
  final String gender;
  final String age;
  final String dob;
  final String classAssigned;
  final String mobile;
  final String profession;
  final String address;

  factory VolunteerDbModel.fromJson(Map<String, dynamic> json) => VolunteerDbModel(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    gender: json["gender"],
    age: json["age"],
    dob: json["dob"],
    classAssigned: json["classAssigned"],
    mobile: json["mobile"],
    profession: json["profession"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "gender": gender,
    "age": age,
    "dob": dob,
    "classAssigned": classAssigned,
    "mobile": mobile,
    "profession": profession,
    "address": address,
  };
}

