// final username= "togAdmin"
// password: togAdmin
import 'package:flutter/material.dart';
const MONGO_CONN_URL = "mongodb+srv://togAdmin:togAdmin@cluster0.51un51k.mongodb.net/MyDb?retryWrites=true&w=majority";
const STUDENT_COLLECTION = "Student";
const VOLUNTEER_COLLECTION = "Volunteer";


class Constants {
  static const double kPadding = 10.0;
  static const Color purpleLight = Color(0XFF1e224c);
  static const Color purpleDark = Color(0XFF0d193e);
  static const Color orange = Color(0XFFec8d2f);
  static const Color red = Color(0XFFf44336);
}

class AppStyle {
  static Color primaryColor = const Color(0xFF222222);
  static Color textInputColor = const Color(0xFF404040);
  static Color accentColor = const Color.fromARGB(255, 124, 164, 204);
}