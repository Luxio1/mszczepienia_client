import 'package:flutter/material.dart';
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
  const ProfileScreen({
    Key? key,
    required this.profile
}) : super(key: key);

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            Expanded(
              child: buildMenu(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        ListTile(
          title: const Text('Wyloguj',
          style: TextStyle(color: Colors.white),),
          onTap: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            Provider.of<AppStateManager>(context, listen: false).logout();
            Provider.of<ProfileManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }
  
  Widget buildProfile() {
    return Column(
      children: [
        Text(
          widget.profile.email,
          style: const TextStyle(fontSize: 21, color: Colors.white),
        ),
        Text(
          widget.profile.users[0].firstName,
          style: const TextStyle(fontSize: 21, color: Colors.white),
        ),
        Text(
          widget.profile.users[0].lastName,
          style: const TextStyle(fontSize: 21, color: Colors.white),
        ),
        Text(
          widget.profile.users[0].pesel,
          style: const TextStyle(fontSize: 21, color: Colors.white),
        ),
      ],
    );
  }

}