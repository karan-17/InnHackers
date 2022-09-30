import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:innhacks/dbHelper/MongoDbModel.dart';
import 'package:innhacks/dbHelper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart' as mdb;

//
class StudentDetails extends StatefulWidget {
  StudentDetails({Key? key}) : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var ageController = TextEditingController();
  var dobController = TextEditingController();
  var stuClassController = TextEditingController();
  var mobileController = TextEditingController();
  var enrolmentDateController = TextEditingController();
  var guardianController = TextEditingController();
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
              "Student Details",
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
              controller: stuClassController,
              decoration: const InputDecoration(
                labelText: "Class",
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
              controller: enrolmentDateController,
              decoration: const InputDecoration(
                labelText: "Enrolment Date",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: guardianController,
              decoration: const InputDecoration(
                labelText: "Guardian's Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
            ),
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
                                stuClassController.text,
                                mobileController.text,
                                enrolmentDateController.text,
                                guardianController.text,
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
      String stuClass,
      String mobile,
      String enroldt,
      String guardian,
      String address) async {
    var _id = mdb.ObjectId();
    final data = StudentDbModel(
        id: _id,
        email: email,
        name: name,
        gender: gender,
        age: age,
        dob: dob,
        stuClass: stuClass,
        mobile: mobile,
        enrolmentDate: enroldt,
        guardian: guardian,
        address: address);
    var result = await MongoDatabase.insertStudent(data);
    _clearAll();
  }

  _clearAll(){
    emailController.text="";
    nameController.text="";
    genderController.text="";
    ageController.text="";
    dobController.text="";
    stuClassController.text="";
    mobileController.text="";
    enrolmentDateController.text="";
    guardianController.text="";
    addressController.text="";
  }

  void _fakedata() {
    setState(() {
      emailController.text = faker.internet.email();
      nameController.text = faker.person.name();
      genderController.text = faker.person.suffix();
      ageController.text = faker.randomGenerator.integer(100).toString();
      dobController.text = faker.date.toString();
      stuClassController.text = faker.randomGenerator.integer(12).toString();
      mobileController.text = faker.phoneNumber.toString();
      enrolmentDateController.text = faker.date.toString();
      guardianController.text = faker.person.name();
      addressController.text = faker.address.toString();
    });
  }
}
