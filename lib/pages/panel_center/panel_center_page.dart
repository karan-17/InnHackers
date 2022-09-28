import 'dart:ui';
import 'package:flutter/material.dart';

import '../../dbHelper/constants.dart';
import '../charts.dart';


class Person {
  String name;
  String feedback;
  Color color;
  Person({required this.name, required this.color, required this.feedback});
}

class PanelCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Person> _persons = [
      Person(name: "Theia Bowen", color: Color(0xfff8b250), feedback: 'Attended all the days'),
      Person(name: "Fariha Odling", color: Color(0xffff5182), feedback: 'The student is good'),
      Person(name: "Viola Willis", color: Color(0xff0293ee), feedback: 'The Student is average, could improve with consistent practice'),
      Person(name: "Emmett Forrest", color: Color(0xfff8b250), feedback: 'Attended all the days'),
      Person(name: "Nick Jarvis", color: Color(0xff13d38e),feedback: 'Attended all the days'),
      Person(name: "ThAmit Clayeia", color: Color(0xfff8b250),feedback: 'Attended all the days'),
      Person(name: "ThAmalie Howardeia", color: Color(0xffff5182),feedback: 'Attended all the days'),
      Person(name: "Campbell Britton", color: Color(0xff0293ee),feedback: 'good in english, need to improve in maths'),
      Person(name: "Haley Mellor", color: Color(0xffff5182),feedback: 'the student is curious and eager to learn'),
      Person(name: "Harlen Higgins", color: Color(0xff13d38e),feedback: 'Attended all the days'),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                left: Constants.kPadding / 2),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                width: double.infinity,
                child: ListTile(
                  //leading: Icon(Icons.sell),
                  title: Text(
                    "Products Available",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "82% of Products Avail.",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                    label: Text(
                      "20,500",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          BarChartSample2(),
          Padding(
            padding: const EdgeInsets.only(
                top: Constants.kPadding,
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                bottom: Constants.kPadding),
            child: Card(
              color: Constants.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text('Feedbacks',style:TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Column(
                    children: List.generate(
                      _persons.length,
                      (index) => ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    _persons[index].name.substring(0, 1),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          backgroundColor: _persons[index].color,
                        ),
                        title: Text(
                          _persons[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          _persons[index].feedback,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.message,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
