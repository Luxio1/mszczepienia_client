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
      body: Center(

      ),
    );
  }
}