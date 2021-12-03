import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:mszczepienia_client/managers/visits_manager.dart';
import 'package:provider/provider.dart';
import '../models/pages.dart';
import '../models/models.dart';
import '../managers/managers.dart';


class YourAppointments extends StatefulWidget {

  static MaterialPage page() {
    return MaterialPage(
      name: Pages.yourAppointments,
      key: ValueKey(Pages.yourAppointments),
      child: const YourAppointments()
    );
  }

  const YourAppointments ({Key? key}) : super(key: key);

  @override
  State<YourAppointments> createState() => _YourAppointmentsState();
}

class _YourAppointmentsState extends State<YourAppointments> {

  List<Visit>? _appointments ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje Szczepienia'),
        backgroundColor: MyColors.blue,
      ),
      body: _appointments != null ?
      ListView.builder(
        itemCount: _appointments!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_appointments![index].id.toString()),
            //TODO: add details view after click
          );
        }
      )
      : const Text(
        "Nie masz umówionych szczepień",
        style: TextStyle(color: Colors.white),),
      floatingActionButton: addButton(),
      backgroundColor: MyColors.blue,
    );
  }

  Widget addButton() {
    return Container(
      padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: GestureDetector(
        child: RawMaterialButton(
          onPressed: () {
            Provider.of<VisitsManager>(context, listen: false)
                .tapOnCreateNewItem(true);
          },
          fillColor: MyColors.lightBlue,
          child: const Icon(
            Icons.add,
            size: 25.0,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
        )
      ),
    );
  }

}