import 'package:flutter/material.dart';
import 'package:mszczepienia_client/admin_screens/patient_list.dart';
import 'package:mszczepienia_client/admin_screens/todays_vaccinations.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:mszczepienia_client/user_screens/your_appointments.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../user_screens/screens.dart';
import '../managers/managers.dart';
import 'facility_data.dart';

class HomeAdmin extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: Pages.homePath,
      key: ValueKey(Pages.homePath),
      child: HomeAdmin(
        currentTab: currentTab,
      ),
    );
  }

  const HomeAdmin ({
    Key? key,
    required this.currentTab
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeAdminState createState() => _HomeAdminState();
}


class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Consumer <AppStateManager>(
      builder: (context,
          appStateManager,
          child,) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'mSzczepienia - admin',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: MyColors.blue,
            elevation: 0,
            actions: [
              profileButton(),
            ],
          ),
          backgroundColor: MyColors.blue,
          body:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: const Size(300, 70)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ParientList()),
                      );
                    },
                    child: const Text('Lista pacjentów'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: const Size(300, 70)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TodaysVaccinations()),
                      );
                    },
                    child: const Text('Dzisiejsze szczepienia'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: const Size(300, 70)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FacilityData()),
                      );
                    },
                    child: const Text('Dane placówki'),
                  ),
                ],
              )
          ),


        );
      },
    );
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          child: Icon(
            Icons.account_circle,
            size: 30.0,
          ),
          backgroundColor: MyColors.lightBlue,
        ),
        onTap: () {
          Provider.of<ProfileManager>(context, listen: false)
              .tapOnProfileModerator(true);
        },
      ),
    );
  }
}