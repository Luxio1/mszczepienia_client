import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';

class TodaysVaccinations extends StatelessWidget {
  const TodaysVaccinations({Key? key}) : super(key: key);

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
      body: ListView(
          children: const <Widget>[
          Card(
            child: ListTile(
              leading: Text('08:30', style: TextStyle(fontSize: 30.0)),
              title: Text('Parker Clayton'),
              subtitle: Text(
                  '1 dawka | COVID-19 | Moderna'
              ),
              trailing: Icon(
                Icons.cancel,
              ),

            ),
          ),
            Card(
              child: ListTile(
                leading: Text('08:45', style: TextStyle(fontSize: 30.0)),
                title: Text('Brooklyn Bell'),
                subtitle: Text(
                    '1 dawka | COVID-19 | Moderna'
                ),
                trailing: Icon(
                  Icons.cancel,
                ),

              ),
            ),
            Card(
              child: ListTile(
                leading: Text('09:00', style: TextStyle(fontSize: 30.0)),
                title: Text('Parker Clayton'),
                subtitle: Text(
                    '1 dawka | COVID-19 | Moderna'
                ),
                trailing: Icon(
                  Icons.cancel,
                ),

              ),
            ),
            Card(
              child: ListTile(
                leading: Text('12:00', style: TextStyle(fontSize: 30.0)),
                title: Text('Domenic Kelly'),
                subtitle: Text(
                    '1 dawka | COVID-19 | Moderna'
                ),
                trailing: Icon(
                  Icons.cancel,
                ),

              ),
            ),
            Card(
              child: ListTile(
                leading: Text('12:30', style: TextStyle(fontSize: 30.0)),
                title: Text('Denny Brown'),
                subtitle: Text(
                    '1 dawka | COVID-19 | Moderna'
                ),
                trailing: Icon(
                  Icons.cancel,
                ),

              ),
            ),
      ]
    ),
    );
  }
}