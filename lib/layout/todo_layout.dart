import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../modules/add_event_screen/add_event_screen.dart';
import '../modules/clear_data/clear_data.dart';
import '../modules/search_events/search_events.dart';
import '../shared/componets/componets.dart';
import '../shared/styles/styles.dart';
import '../shared/styles/thems.dart';
import 'todo_layoutcontroller.dart';

class TodoLayout extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoLayoutController>(
      init: Get.find<TodoLayoutController>(),
      builder: (todocontroller) => Scaffold(
        drawer: _drawer(context),
        key: _scaffoldkey,
        // NOTE App Bar
        appBar: _appbar(todocontroller, context),

        //NOTE Body
        body: Obx(
          () => todocontroller.isloading.value
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.yMMMMd().format(DateTime.parse(
                                    todocontroller.currentSelectedDate)),
                                style: subHeaderStyle,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                todocontroller.currentSelectedDate !=
                                        DateTime.now()
                                            .toString()
                                            .split(' ')
                                            .first
                                    ? DateFormat.E().format(DateTime.parse(
                                        todocontroller.currentSelectedDate))
                                    : "Today",
                                style: headerStyle,
                              ),
                            ],
                          ),
                          defaultButton(
                              text: "Add Event",
                              width: 100,
                              onpress: () {
                                Get.to(() => AddEventScreen());
                              },
                              gradient: orangeGradient,
                              radius: 15),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //NOTE timeline datepicker -------------
                      Container(
                        child: DatePicker(
                          DateTime.now(),
                          height: 80,
                          width: 60,
                          initialSelectedDate: DateTime.now(),
                          selectionColor: defaultLightColor,
                          selectedTextColor: Colors.white,
                          dayTextStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                          dateTextStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          monthTextStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                          onDateChange: (value) {
                            var selecteddate = value.toString().split(' ');
                            print(selecteddate[0]);
                            todocontroller.onchangeselectedate(selecteddate[0]);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // NOTE list Of Tasks
                      Expanded(
                          child: todocontroller
                              .screens[todocontroller.currentIndex]),
                    ],
                  ),
                ),
        ),

        //NOTE bottom navigation
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: todocontroller.currentIndex,
          onTap: (index) {
            todocontroller.onchangeIndex(index);
          },
          items: todocontroller.bottomItems,
        ),
      ),
    );
  }

  _appbar(TodoLayoutController todocontroller, BuildContext context) => AppBar(
        title: Text(
          todocontroller.appbar_title[todocontroller.currentIndex],
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //TODO: search screen
              Get.to(() => SearchEvents());
              //NotificationApi.shownotification();
            },
            icon: Icon(
              Get.isDarkMode ? Icons.search : Icons.search,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              todocontroller.onchangeThem();
            },
            icon: Icon(
              Get.isDarkMode ? Icons.wb_sunny : Icons.mode_night,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      );

  _drawer(BuildContext context) => Drawer(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(gradient: orangeGradient),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        const CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/events/karen_0W6Zqpq.PNG')),
                        const SizedBox(
                          width: 10,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.cloud),
                          color: Colors.grey.shade200,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "SIGN IN",
                    style: TextStyle(
                        letterSpacing: 2, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Synchronization disabled...",
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(ClearData());
              },
              leading: const Icon(Icons.delete),
              title: const Text("Clear Data"),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.search),
              title: const Text("Search"),
            ),
          ],
        ),
      );
}
