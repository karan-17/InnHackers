import '../../dbHelper/constants.dart';

import 'package:flutter/material.dart';

import '../charts.dart';
import '../panel_left/panel_left_page.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  List<Product> _products = [
    Product(name: "LED Submersible Lights", enable: true),
    Product(name: "Portable Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Smart Watch", enable: true),
    Product(name: "Temporary Tattoos", enable: true),
    Product(name: "Bookends", enable: true),
    Product(name: "Vegetable Chopper", enable: true),
    Product(name: "Neck Massager", enable: true),
    Product(name: "Facial Cleanser", enable: true),
    Product(name: "Back Cushion", enable: true),
  ];
  final List<Todo> _todos = [
  Todo(name: "Student Attendance Portal Activate", enable: true),
  Todo(name: "Volunteer Attendance Portal Activate", enable: true),
  Todo(name: "Send data to Head Branch", enable: true),
  Todo(name: "Revenue Strategy Analysis", enable: true),
  // Todo(name: "Selling furniture", enable: true),
  // Todo(name: "Finish the disclosure", enable: true),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding / 2,
                  top: Constants.kPadding / 2,
                  left: Constants.kPadding / 2),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                    leading: Icon(Icons.arrow_upward_sharp, color: Colors.green, size: 40,),
                    title: Text(
                      "Gross Revenue",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "75% of Avg. Revenue",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        "Rs. 36.5L",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            LineChartSample1(),
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding / 2,
                  bottom: Constants.kPadding,
                  top: Constants.kPadding,
                  left: Constants.kPadding / 2),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: List.generate(
                    _todos.length,
                    (index) => SwitchListTile.adaptive(
                      title: Text(
                        _todos[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      value: _todos[index].enable,
                      onChanged: (newValue) {
                        setState(() {
                          _todos[index].enable = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
