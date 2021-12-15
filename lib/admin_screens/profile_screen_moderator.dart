import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mszczepienia_client/admin_screens/home.dart';
import 'package:provider/provider.dart';
import '../helpers/mycolors.dart';

import '../models/models.dart';
import '../managers/managers.dart';

class ProfileScreenModerator extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.userProfilePath,
      key: ValueKey(Pages.userProfilePath),
      child: const ProfileScreenModerator(),
    );
  }

  const ProfileScreenModerator({Key? key}) : super(key: key);

  @override
  _ProfileScreenModeratorState createState() => _ProfileScreenModeratorState();
}

class _ProfileScreenModeratorState extends State<ProfileScreenModerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfileModerator(false);
          },
        ),
      ),
      backgroundColor: MyColors.blue,
      body: ListView(
        children: [
          const SizedBox(height: 20.0),
          const Text(
            'Facility Name (ID 0001)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: logoutButton(),
          ),
        ],
      ),
    );
  }


  Widget logoutButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.redAccent),
      child: const Text(
        'Wyloguj',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Provider.of<AppStateManager>(context, listen: false).logout();
        Provider.of<ProfileManager>(context, listen: false).logout();
      },
    );
  }

}
