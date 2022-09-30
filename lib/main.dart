import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innhacks/login.dart';
import 'package:innhacks/shared/network/local/TodoDbHelper.dart';
import 'package:innhacks/widget_tree.dart';
import 'dbHelper/mongodb.dart';
import 'layout/todo_layout.dart';
import 'layout/todo_layoutcontroller.dart';
import 'shared/styles/thems.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  (){
    MongoDatabase.connect();
    Firebase.initializeApp();
   Hive.initFlutter();
   Hive.openBox('');
  }();
Get.put(TodoLayoutController());
var db = TodoDbHelper.db.createDatabase();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //NOTE to use 24 hour format
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!),
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkThem,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: LoginScreen(),
    );
  }
}
