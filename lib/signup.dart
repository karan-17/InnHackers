import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dbHelper/constants.dart';
import 'login.dart';
import 'services/authservices.dart';
import 'signin.dart';
import 'user.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  var email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    'images/top.svg',
                    width: 400,
                    height: 150,
                  )),
              Container(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Text(
                        "Signup",
                        style: GoogleFonts.pacifico(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: email),
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter something';
                            } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Enter valid email';
                            }
                          },
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Email',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: password),
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter something';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.vpn_key,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Password',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(color: Colors.blue)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(55, 16, 16, 0),
                        child: Container(
                          height: 50,
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                              onPressed: ()  {
                                AuthService().addUser(email, password).then((value){
                                  Fluttertoast.showToast(msg: "User added", 
                                  toastLength: Toast.LENGTH_SHORT, 
                                  gravity: ToastGravity.BOTTOM, 
                                  backgroundColor: Colors.green, 
                                  textColor: Colors.white, 
                                  fontSize: 16.0);
                                });
                              },
                              child: const Text(
                                "Signup",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              )),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                          child: Row(
                            children: [
                              const Text(
                                "Already have Account ? ",
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                 Get.to(() =>LoginScreen());
                                },
                                child: const Text(
                                  "Signin",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}