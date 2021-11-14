import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import '../models/pages.dart';

class NewAppointmentScreen extends StatefulWidget {

  static MaterialPage page() {
    return MaterialPage(
        name: Pages.newAppointment,
        key: ValueKey(Pages.newAppointment),
        child: const NewAppointmentScreen()
    );
  }

  const NewAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointmentScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(color: MyColors.blue,);
  }

}