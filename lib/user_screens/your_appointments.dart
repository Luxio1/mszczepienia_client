import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:mszczepienia_client/managers/visits_manager.dart';
import 'package:mszczepienia_client/services/api_service.dart';
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

  List<Visit> _visits = [];
  ValueNotifier<List<Visit>> _visitsNotifier = ValueNotifier([]);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje Szczepienia'),
        backgroundColor: MyColors.blue,
      ),
      body: Column(
        children: <Widget>[
          _visits.isNotEmpty ?
          visitList()
              : noVisits(),
          refreshVisitsButton(),
        ],
      ),
      floatingActionButton: addButton(),
      backgroundColor: MyColors.blue,
    );
  }

  Widget visitList() {
    return Expanded(
      child: ValueListenableBuilder<List<Visit>> (
        valueListenable: _visitsNotifier,
        builder: (context, _visits, _) {
          return ListView.builder(
              itemCount: _visits.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Text(_visits[index].localDate.toString()),
                    subtitle: Text(_visits[index].localTime.toString()),
                  ),
                );
              }
          );
        },
      ),
    );
  }

  Widget noVisits() {
    return const Text(
      "Nie masz umówionych szczepień",
      style: TextStyle(color: Colors.white));
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

  Widget refreshVisitsButton() {
    return ElevatedButton(onPressed: () async {
      int patientId = Provider.of<ProfileManager>(context, listen: false).getProfile.getMainPatient.id;
      _visits = await APIService.getPendingVisits(patientId);
      print(_visits);
      _visitsNotifier.value = _visits;
    },
    child: const Text("Odśwież listę"),);

  }

}