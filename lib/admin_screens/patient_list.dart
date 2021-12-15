import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';

class ParientList extends StatelessWidget {
  const ParientList({Key? key}) : super(key: key);

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
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Parker Clayton'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Brooklyn Bell'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Domenic Kelly'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Denny Brown'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Paula Watson'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Marigold Martin'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Mark Mason'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Parker Clayton'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Brooklyn Bell'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Domenic Kelly'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Denny Brown'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Paula Watson'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Marigold Martin'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 42.0),
              title: Text('Mark Mason'),
              subtitle: Text('93093073927'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      )
    );
  }
}