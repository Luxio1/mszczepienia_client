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
        child: const YourAppointments());
  }

  const YourAppointments({Key? key}) : super(key: key);

  @override
  State<YourAppointments> createState() => _YourAppointmentsState();
}

class _YourAppointmentsState extends State<YourAppointments> {
  List<Visit> _visits = [];
  ValueNotifier<List<Visit>> _visitsNotifier = ValueNotifier([]);

  @override
  void initState() {
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje Szczepienia'),
        backgroundColor: MyColors.blue,
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Column(
          children: <Widget>[visitList()],
        ),
      ),
      floatingActionButton: addButton(),
      backgroundColor: MyColors.blue,
    );
  }

  Widget visitList() {
    return Expanded(
      child: ValueListenableBuilder<List<Visit>>(
        valueListenable: _visitsNotifier,
        builder: (context, _visits, _) {
          return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
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
                    trailing: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      child: const Icon(Icons.cancel),
                      onPressed: () async {
                        bool isCancelled =
                            await APIService.cancelVisit(_visits[index].id);
                        if (isCancelled) {
                          setState(() {
                            _visits.removeAt(index);
                          });
                        }
                      },
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choroba: " +
                            _visits[index].vaccine.disease.name.toString()),
                        Text("Producent: " +
                            _visits[index]
                                .vaccine
                                .manufacturer
                                .name
                                .toString()),
                        Text("Data: " + _visits[index].localDate.toString()),
                        Text("Godzina: " + _visits[index].localTime.toString()),
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Placówka: " +
                            _visits[index].place.name.toString()),
                        Text("Ulica: " +
                            _visits[index].place.address.street.toString() +
                            " " +
                            _visits[index].place.address.number.toString()),
                        Text("Miasto: " +
                            _visits[index].place.address.city.name.toString()),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
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
      )),
    );
  }

  Future<void> refresh() async {
    int patientId = Provider.of<ProfileManager>(context, listen: false)
        .getProfile
        .getMainPatient
        .id;
    List<Visit> _pendingVisits =
        await APIService.getVisitsWithStatus(patientId, VisitStatus.PENDING);
    setState(() {
      _visits.clear();
      _visitsNotifier.value = _visits;
      _visits = _pendingVisits;
      _visitsNotifier.value = _visits;
    });
  }
}
