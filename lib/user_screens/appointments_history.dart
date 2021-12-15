import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:mszczepienia_client/managers/visits_manager.dart';
import 'package:mszczepienia_client/services/api_service.dart';
import 'package:provider/provider.dart';
import '../models/pages.dart';
import '../models/models.dart';
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

  ValueNotifier<List<Visit>> _cancelledVisitsNotifier = ValueNotifier([]);
  ValueNotifier<List<Visit>> _missedVisitsNotifier = ValueNotifier([]);
  ValueNotifier<List<Visit>> _finishedVisitsNotifier = ValueNotifier([]);

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
          children: <Widget>[
            const SizedBox(height: 10.0),
            const Text("Odbyte szczepienia", style: TextStyle(color: Colors.white, fontSize: 18),),
            const SizedBox(height: 10.0),
            visitList(VisitStatus.FINISHED),
            const SizedBox(height: 10.0),
            const Text("Odwołane szczepienia", style: TextStyle(color: Colors.white, fontSize: 18),),
            const SizedBox(height: 10.0),
            visitList(VisitStatus.CANCELLED),
            const SizedBox(height: 10.0),
            const Text("Przegapione szczepienia", style: TextStyle(color: Colors.white, fontSize: 18),),
            const SizedBox(height: 10.0),
            visitList(VisitStatus.MISSED),
          ],
        ),
      ),
      backgroundColor: MyColors.blue,
    );
  }

  Widget visitList(VisitStatus status) {
    return Expanded(
      child: ValueListenableBuilder<List<Visit>> (
        valueListenable: status == VisitStatus.FINISHED ? _finishedVisitsNotifier
            : status == VisitStatus.CANCELLED ? _cancelledVisitsNotifier
            : _missedVisitsNotifier,
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
                    color: status == VisitStatus.FINISHED ? Colors.lightGreen
                    : status == VisitStatus.CANCELLED ? Colors.grey
                        : Colors.redAccent
                  ),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choroba: " + _visits[index].vaccine.disease.name.toString()),
                        Text("Producent: " + _visits[index].vaccine.manufacturer.name.toString()),
                        Text("Data: " + _visits[index].localDate.toString()),
                        Text("Godzina: " + _visits[index].localTime.toString()),
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Placówka: " + _visits[index].place.name.toString()),
                        Text("Ulica: " + _visits[index].place.address.street.toString() + " " + _visits[index].place.address.number.toString()),
                        Text("Miasto: " + _visits[index].place.address.city.name.toString()),
                      ],
                    ),
                  ),
                );
              }
          );
        },
      ),
    );
  }


  Future<void> refresh() async {
    int patientId = Provider.of<ProfileManager>(context, listen: false).getProfile.getMainPatient.id;
    _finishedVisitsNotifier.value = await APIService.getVisitsWithStatus(patientId, VisitStatus.FINISHED);
    _missedVisitsNotifier.value = await APIService.getVisitsWithStatus(patientId, VisitStatus.MISSED);
    _cancelledVisitsNotifier.value = await APIService.getVisitsWithStatus(patientId, VisitStatus.CANCELLED);
  }

}