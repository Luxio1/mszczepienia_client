import 'package:flutter/material.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import '../models/pages.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../managers/managers.dart';

class NewAppointmentScreen extends StatefulWidget {

  static MaterialPage page() {
    return MaterialPage(
        name: Pages.newAppointment,
        key: ValueKey(Pages.newAppointment),
        child: const NewAppointmentScreen()
    );
  }

  const NewAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointmentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<VisitsManager>(context, listen: false)
                .tapOnCreateNewItem(false);
          },
        ),
      ),
      backgroundColor: MyColors.blue,
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 50.0),
          child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  xs: 12,
                  lg: 6,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 100,
                    alignment: Alignment(0, 0),
                    color: MyColors.lightBlue,
                    child: Text("Szepionka COVID-19"),
                  ),

                ),
                ResponsiveGridCol(
                  xs: 12,
                  lg: 6,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 100,
                    alignment: Alignment(0, 0),
                    color: MyColors.lightBlue,
                    child: Text("Szepionka COVID-20"),
                  ),

                ),
                ResponsiveGridCol(
                  xs: 12,
                  lg: 6,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 100,
                    alignment: Alignment(0, 0),
                    color: MyColors.lightBlue,
                    child: Text("Szepionka COVID-21"),
                  ),

                ),

              ]
          )
      ),
    );

  }

}