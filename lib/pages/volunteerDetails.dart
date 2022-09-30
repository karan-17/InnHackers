//similar to studentDetails.dart

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:innhacks/dbHelper/MongoDbModel.dart';
import 'package:innhacks/dbHelper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart' as mdb;

class VolunteerDetails extends StatefulWidget {
  const VolunteerDetails({Key? key}) : super(key: key);

  @override
  State<VolunteerDetails> createState() => _VolunteerDetailsState();
}

class _VolunteerDetailsState extends State<VolunteerDetails> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var ageController = TextEditingController();
  var dobController = TextEditingController();
  var classAssignedController = TextEditingController();
  var mobileController = TextEditingController();
  var professionController = TextEditingController();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Volunteer Details",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: genderController,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: "Date of Birth",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: classAssignedController,
                decoration: const InputDecoration(
                  labelText: "Class Assigned",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  labelText: "Mobile",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: professionController,
                decoration: const InputDecoration(
                  labelText: "Profession",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: "Father's Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _fakedata();
                    },
                    child: const Text("Generate data"),
                  ),
                  const SizedBox(width: 50,),
                  ElevatedButton(
                    onPressed: () {
                      _insertData(
                          nameController.text,
                          emailController.text,
                          genderController.text,
                          ageController.text,
                          dobController.text,
                          classAssignedController.text,
                          mobileController.text,
                          professionController.text,
                          addressController.text);
                    },
                    child: const Text("Push to db"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insertData(
      String name,
      String email,
      String gender,
      String age,
      String dob,
      String classAssigned,
      String mobile,
      String profession,
      String address) async {
    var _id = mdb.ObjectId();
    final data = VolunteerDbModel(
        id: _id,
        email: email,
        name: name,
        gender: gender,
        age: age,
        dob: dob,
        classAssigned: classAssigned,
        mobile: mobile,
        profession: profession,
        address: address);
    var result = await MongoDatabase.insertVolunteer(data);
    _clearAll();
  }

  _clearAll(){
    emailController.text="";
    nameController.text="";
    genderController.text="";
    ageController.text="";
    dobController.text="";
    classAssignedController.text="";
    mobileController.text="";
    professionController.text="";
    addressController.text="";
  }

  void _fakedata() {
    setState(() {
      emailController.text = faker.internet.email();
      nameController.text = faker.person.name();
      genderController.text = faker.person.suffix();
      ageController.text = faker.randomGenerator.integer(100).toString();
      dobController.text = faker.date.toString();
      classAssignedController.text = faker.randomGenerator.integer(12).toString();
      mobileController.text = faker.phoneNumber.toString();
      professionController.text = faker.job.toString();
      addressController.text = faker.address.toString();
    });
  }
}