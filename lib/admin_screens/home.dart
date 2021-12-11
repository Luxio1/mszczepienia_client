import 'package:flutter/material.dart';
import 'package:mszczepienia_client/admin_screens/facility_data.dart';
import 'package:mszczepienia_client/admin_screens/patient_list.dart';
import 'package:mszczepienia_client/admin_screens/todays_vaccinations.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue,
      appBar: AppBar(
        title: const Text(
          'mSzczepienia - admin',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MyColors.blue,
        elevation: 0,
      ),
      body: Center(
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
  }
}