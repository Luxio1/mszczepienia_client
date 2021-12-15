import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';

class FacilityData extends StatelessWidget {
  const FacilityData({Key? key}) : super(key: key);

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
              margin: EdgeInsets.all(20),
              child: Padding(padding: EdgeInsets.all(10),
                child: ListTile(
                  title: Text('Facility Name (ID: 0001)'),
                  subtitle: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 10),
                    child: Text("Users: 31\nAddress: Example Address 101\nActive: Yes"),
                  ),
                  isThreeLine: true,
                ),
              )


            ),


      ]
      )
    );
  }
}