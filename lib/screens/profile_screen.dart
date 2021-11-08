import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';


class ProfileScreen extends StatefulWidget {
  static MaterialPage page(User user) {
    return MaterialPage(
      name: '/profile',
      key: const ValueKey('/profile'),
      child: ProfileScreen(user: user),
    );
  }

  final User user;
  const ProfileScreen({
    Key? key,
    required this.user
}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
          },
        ),
      ),
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
          title: const Text('logout'),
          onTap: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }
  
  Widget buildProfile() {
    return Column(
      children: [
        Text(
          widget.user.firstName,
          style: const TextStyle(fontSize: 21),
        ),
        Text(
          widget.user.lastName,
          style: const TextStyle(fontSize: 21),
        )
      ],
    );
  }

}