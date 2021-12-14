import 'package:flutter/material.dart';
import 'package:mszczepienia_client/admin_screens/admin_home.dart';
import 'package:provider/provider.dart';
import '../helpers/mycolors.dart';

import '../models/models.dart';
import '../managers/managers.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page(Profile profile) {
    return MaterialPage(
      name: Pages.userProfilePath,
      key: ValueKey(Pages.userProfilePath),
      child: ProfileScreen(profile: profile),
    );
  }

  final Profile profile;

  const ProfileScreen({Key? key, required this.profile}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
          },
        ),
      ),
      backgroundColor: MyColors.blue,
      body: ListView(
        children: [
          const SizedBox(height: 20.0),
          buildProfile(),
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

  Widget buildProfile() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              "Imię: " + widget.profile.users[0].firstName,
              style: const TextStyle(fontSize: 21, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              "Nazwisko: " + widget.profile.users[0].lastName,
              style: const TextStyle(fontSize: 21, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              "Email: " + widget.profile.email,
              style: const TextStyle(fontSize: 21, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              "PESEL: " + widget.profile.users[0].pesel,
              style: const TextStyle(fontSize: 21, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
