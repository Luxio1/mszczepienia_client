import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';

import '../models/visit.dart';
import '../models/pages.dart';
import '../managers/managers.dart';


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

  List<Visit>? _visits ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        title: const Text('Historia szczepień'),
      ),
      body: _visits != null ?
      ListView.builder(
          itemCount: _visits!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_visits![index].localDate),
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