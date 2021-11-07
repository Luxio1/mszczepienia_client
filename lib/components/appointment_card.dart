import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {

  final String type;
  final String manufacturer;
  final String address;
  //final DateTime appointmentDate;


  const AppointmentCard({
    Key? key,
  required this.type,
  required this.manufacturer,
  required this.address,
  //required this.appointmentDate
  }) : super(key: key);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();

}

class _AppointmentCardState extends State<AppointmentCard>{
  //TODO: Add confirming possibility
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                const Text('Typ:', style: TextStyle(fontSize: 16)),
          Text(widget.type, style: const TextStyle(fontSize: 16))],
          ),
          Row(
            children: [
              const Text('Producent:', style: TextStyle(fontSize: 14)),
              Text(widget.manufacturer, style: const TextStyle(fontSize: 14))],
          ),
          Row(
            children: [
              const Text('Adres:', style: TextStyle(fontSize: 14)),
              Text(widget.address, style: const TextStyle(fontSize: 14))],
          ),
          ],
    ),
      );
  }
}