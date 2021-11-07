import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../components/appointment_card.dart';


class AppointmentsHistory extends StatefulWidget {

  static MaterialPage page() {
    return const MaterialPage(
        name: '/history',
        key: ValueKey('/history'),
        child: AppointmentsHistory()
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
          : const Text("Nie masz historii szczepień"),
    );
  }

}