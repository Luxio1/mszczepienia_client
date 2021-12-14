import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:mszczepienia_client/services/api_service.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/pages.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../managers/managers.dart';

class NewAppointmentDatesScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: Pages.newAppointmentDates,
        key: ValueKey(Pages.newAppointmentDates),
        child: const NewAppointmentDatesScreen());
  }

  const NewAppointmentDatesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewAppointmentDatesState();
}

class _NewAppointmentDatesState extends State<NewAppointmentDatesScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  final DateTime _firstDay = DateTime.now();
  final Duration _dateDistance = const Duration(days: 14);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  ValueNotifier _selectedHourNotifier = ValueNotifier('Brak');

  late int placeId;
  late int vaccineId;

  //TODO: add showing firstDay visit hours
  ValueNotifier<List<String>> _selectedEvents = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    placeId = Provider.of<VisitsManager>(context, listen: false).getPlaceId;
    vaccineId = Provider.of<VisitsManager>(context, listen: false).getVaccineId;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<VisitsManager>(context, listen: false)
                .tapOnCreateNewItem(false);
          },
        ),
      ),
      backgroundColor: MyColors.blue,
      body: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          calendar(),
          const SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
              valueListenable: _selectedHourNotifier,
              builder: (context, value, _) {
                return Text("Wybrana godzina: " + _selectedHourNotifier.value);
          }
          ),
          suggestedHours(),
          const SizedBox(
            height: 20,
          ),
          bookButton(),
        ]),
      ),
    );
  }

  Widget calendar() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: _firstDay,
      lastDay: _firstDay.add(_dateDistance),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) async {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          _selectedHourNotifier.value = "Brak";
        });

        _selectedEvents.value = await APIService.getAvailableHoursForDay(
            _selectedDay, placeId, vaccineId);
        //print(_selectedEvents.value);
      },
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  Widget suggestedHours() {
    return Expanded(
        child: ValueListenableBuilder<List<dynamic>>(
      valueListenable: _selectedEvents,
      builder: (context, hoursList, _) {
        return ListView.builder(
            itemCount: hoursList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  onTap: () => _selectedHourNotifier.value = hoursList[index],
                  title: Text(hoursList[index]),
                ),
              );
            });
      },
    ));
  }

  Widget bookButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white24,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            shape: const StadiumBorder()),
        onPressed: () async {
          String date = dayFormatter.format(_selectedDay) + " " + _selectedHourNotifier.value;
          DateTime fullDate = DateTime.parse(date);
          int patientId = Provider.of<ProfileManager>(context, listen: false)
              .getProfile
              .getMainPatient
              .id;

          APIService.bookVisit(fullDate, placeId, vaccineId, patientId);
          //TODO: check response
        },
        child: const Text(
          'Rezerwuj termin',
          style: TextStyle(fontSize: 14),
        ));
  }
}
