import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import '../models/appointment.dart';
import '../components/appointment_card.dart';
import '../models/pages.dart';


class AppointmentsHistory extends StatefulWidget {

  static MaterialPage page() {
    return MaterialPage(
        name: Pages.appointmentsHistory,
        key: ValueKey(Pages.appointmentsHistory),
        child: const AppointmentsHistory()
    );
  }

  const AppointmentsHistory ({Key? key}) : super(key: key);

  @override
  State<AppointmentsHistory> createState() => _AppointmentsHistoryState();
}

class _AppointmentsHistoryState extends State<AppointmentsHistory> {

  List<Appointment>? _appointments ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        title: const Text('Historia szczepień'),
      ),
      body: _appointments != null ?
      ListView.builder(
          itemCount: _appointments!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_appointments![index].type),
              //TODO: add details view after click
            );
          }
      )
          : const Text(
        "Nie masz historii szczepień",
      style: TextStyle(color: Colors.white),
      ),
      backgroundColor: MyColors.blue,
    );
  }

}