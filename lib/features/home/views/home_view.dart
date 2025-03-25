import 'package:dusterapp/features/home/controller/home_controller.dart';
import 'package:dusterapp/features/profile/widgets/navigation_draw.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:dusterapp/utils/error_page.dart';
import 'package:dusterapp/utils/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeView extends ConsumerStatefulWidget {
  final String lng;
  final String country;
  final Function changeLang;
  final DusterModel duster;
  const HomeView({
    super.key,
    required this.lng,
    required this.country,
    required this.changeLang,
    required this.duster,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class BookingDataSource extends CalendarDataSource {
  BookingDataSource(List<Appointment> bookings) {
    appointments = bookings;
  }
}

class _HomeViewState extends ConsumerState<HomeView> {
  CalendarController _calendarController = CalendarController();
  String view = "month";

  List<Appointment> convertToAppointments(List<dynamic> data) {
    return data.map((booking) {
      final a = booking['order'] != null ? "order" : 'reorder';
      return Appointment(
        startTime: DateTime.parse(booking['start']),
        endTime: DateTime.parse(booking['end']),
        subject: booking['title'] ?? 'No Title',
        id: booking['_id'],
        recurrenceId: booking['order'] ?? booking['reorder'],
        notes: a,
        color: Colors.blue, // Customize as needed
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  void resetCalendar() {
    _calendarController.view = CalendarView.month;
    _calendarController.displayDate = DateTime.now();
    _calendarController.selectedDate = null;
    setState(() {
      view = "month";
    });
  }

  @override
  Widget build(BuildContext context) {
    final duster = widget.duster;
    final name = duster.name;
    return Scaffold(
      drawer: NavigationDrawWidget(
        duster: duster,
        lng: widget.lng,
        country: widget.country,
        changeLang: widget.changeLang,
      ),
      appBar: AppBar(
        title: Text("Hi $name "),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add, color: Colors.grey),
          ),
        ],
      ),
      body: ref
          .watch(initBookings(widget.lng))
          .when(
            data: (data) {
              final appointmentList = convertToAppointments(data);

              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue, width: 2),
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: resetCalendar,
                        child: Text("Today"),
                      ),
                    ),
                    if (view == "day")
                      ElevatedButton(
                        onPressed: () {
                          _calendarController.view = CalendarView.month;
                          setState(() {
                            view = "month";
                          });
                        },
                        child: const Text("Back to Month View"),
                      ),
                    SizedBox(
                      height: 500,
                      child: SfCalendar(
                        controller: _calendarController,
                        view: CalendarView.month,
                        dataSource: BookingDataSource(appointmentList),
                        onTap: (CalendarTapDetails details) {
                          if (view == "day") {
                            if (details.targetElement ==
                                    CalendarElement.appointment &&
                                details.appointments != null &&
                                details.appointments!.isNotEmpty) {
                              final appointment =
                                  details.appointments!.first as Appointment;
                              print("Appointment ID: ${appointment.id}");
                              print("Title: ${appointment.subject}");
                              print("Start: ${appointment.startTime}");
                              print("End: ${appointment.endTime}");
                              print("End: ${appointment.recurrenceId}");
                              print("End: ${appointment.notes}");
                            }
                          } else {
                            if (details.targetElement ==
                                    CalendarElement.calendarCell &&
                                details.date != null) {
                              _calendarController.view = CalendarView.day;
                              _calendarController.displayDate = details.date;
                              setState(() {
                                view = "day";
                              });
                            }
                          }
                        },
                        monthViewSettings: const MonthViewSettings(
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.appointment,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Your Booking Requests",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 200, child: Divider(color: Colors.blue)),
                  ],
                ),
              );
            },
            error:
                (error, st) =>
                    Center(child: ErrorText(error: error.toString())),
            loading: () => const Center(child: Loader(msg: 'Fetching data...')),
          ),
    );
  }
}
