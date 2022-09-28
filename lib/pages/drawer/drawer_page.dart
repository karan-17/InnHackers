
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innhacks/pages/idcard/id_ui.dart';
import 'package:innhacks/pages/qr/generate_qr.dart';
import 'package:innhacks/pages/qr/scan_qr.dart';
import 'package:innhacks/widget_tree.dart';

import '../../dbHelper/constants.dart';
import '../../dbHelper/constants.dart';
import '../../responsive_layout.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({required this.task, required this.taskValue, required this.color});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Scan QR", icon: Icons.qr_code_scanner_sharp),
  ButtonsInfo(title: "Generate QR", icon: Icons.qr_code_scanner_sharp),
  ButtonsInfo(title: "Read Feedbacks", icon: Icons.feedback),
  ButtonsInfo(title: "Download ID Card", icon: Icons.perm_identity_outlined),
  ButtonsInfo(title: "Volunteers", icon: Icons.list),
  ButtonsInfo(title: "Contact Us", icon: Icons.perm_contact_cal_outlined),
  ButtonsInfo(title: "About Us", icon: Icons.people_alt_sharp),
];

List<Routes> _routes = [
  Routes(route: WidgetTree()),
  Routes(route: MyCustomWidget()),
  Routes(route: GenerateQR()),
  Routes(route: WidgetTree()),
  Routes(route: HomePage()),
  Routes(route: WidgetTree()),
  Routes(route: WidgetTree()),
  Routes(route: WidgetTree()),
];

class Routes {
  Widget route;
  Routes({required this.route});
}

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding * 4),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: !ResponsiveLayout.isComputer(context)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close, color: Colors.white),
                      )
                    : null,
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.red.withOpacity(0.9),
                                  Constants.orange.withOpacity(0.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        selectedTileColor: const Color(0XFF1e224c),
                        tileColor: const Color(0XFFec8d2f),
                        title: Text(
                          _buttonNames[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            Get.to(_routes[index].route);
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
