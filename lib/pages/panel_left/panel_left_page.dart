import 'package:innhacks/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../dbHelper/constants.dart';
import '../charts.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({super.key});

  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
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
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding / 2,
                      top: Constants.kPadding / 2,
                      right: Constants.kPadding / 2),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: const ListTile(
                        leading: Icon(Icons.arrow_upward_sharp,
                            color: Colors.green, size: 40),
                        title: Text(
                          "Monthly Revenue",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "+18% than last month",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(                          label: Text(
                            "Rs. 4.5L",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                LineChartSample2(),
                PieChartSample2(),
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
                        (index) => CheckboxListTile(
                          title: Text(
                            _todos[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: _todos[index].enable,
                          onChanged: (newValue) {
                            setState(() {
                              _todos[index].enable = newValue ?? true;
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
        ],
      ),
    );
  }
}
