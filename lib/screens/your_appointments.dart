import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/appointment.dart';

class YourAppointments extends StatefulWidget {

  static MaterialPage page() {
    return const MaterialPage(
      name: '/home',
      key: ValueKey('/home'),
      child: YourAppointments()
    );
  }

  const YourAppointments ({Key? key}) : super(key: key);

  @override
  State<YourAppointments> createState() => _YourAppointmentsState();
}

class _YourAppointmentsState extends State<YourAppointments> {

  List<Appointment>? _appointments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje Szczepienia'),
      ),
      body: _appointments != null ?
      ListView.builder(
        itemCount: _appointments!.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_appointments![index].type),
          //TODO: add details view after click
        ))
      : const Text("Nie masz umówionych szczepień"),
    );
  }

}