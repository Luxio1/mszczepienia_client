import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'screens.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: '/home',
      key: const ValueKey('/home'),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  const Home ({
    Key? key,
    required this.currentTab
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    YourAppointments(),
    AppointmentsHistory()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer <AppStateManager>(
      builder: (context,
          appStateManager,
          child,) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'mSzczepienia',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
            actions: [
              profileButton(),
            ],
          ),
          body: IndexedStack(index: widget.currentTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme
                .of(context)
                .textSelectionTheme
                .selectionColor,
            currentIndex: widget.currentTab,
            onTap: (index) {
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Twoje szczepienia',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: ' Historia'
              ),
            ],
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
          backgroundColor: Colors.green, //TODO: change color, add icon
        ),
        onTap: () {
          //TODO: home -> profile
        },
      ),
    );
  }
}