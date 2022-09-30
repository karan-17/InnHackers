import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../model/event_data_source.dart';
import '../../shared/styles/styles.dart';
import 'search_controller.dart';

class SearchEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (searchController) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Events Calendar',
                  style: eventheaderStyle,
                ),
                // actions: [
                //   _dropdown_menu_item(),
                // ],
              ),
              body: SfCalendar(
                showDatePickerButton: true,
                allowedViews: [
                  CalendarView.day,
                  CalendarView.week,
                  // CalendarView.workWeek,
                  CalendarView.month,
                  CalendarView.schedule
                ],
                dataSource: EventDataSource(searchController.all_event),
                view: CalendarView.month,
                firstDayOfWeek: 1,
                monthViewSettings: const MonthViewSettings(
                    showAgenda: true,
                    //NOTE to show events title not dot
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
                onTap: (CalendarTapDetails calendarTapDetails) {
                  print(calendarTapDetails.date.toString());
                },
                onViewChanged: (viewChangedDetails) {
                  //  print(viewChangedDetails.visibleDates);
                  searchController.getallevents(
                      firstVisibleDate: viewChangedDetails.visibleDates.first,
                      lastVisibleDate: viewChangedDetails.visibleDates.last);
                  // print(viewChangedDetails.visibleDates.first.toString() +
                  //     " " +
                  //     viewChangedDetails.visibleDates.last.toString());
                },
              ));
        });
  }

  // _dropdown_menu_item() {
  //   return PopupMenuButton(
  //     onSelected: (value) {},
  //     icon: const Icon(Icons.calendar_month),
  //     itemBuilder: (context) => [
  //       ...list_of_menuItem.map((e) => PopupMenuItem(
  //             textStyle: Theme.of(context).textTheme.subtitle2,
  //             child: Text(e.toString()),
  //             value: e,
  //           )),
  //     ],
  //   );
  // }
}
