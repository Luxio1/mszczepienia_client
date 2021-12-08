import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:mszczepienia_client/services/api_service.dart';
import '../models/pages.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../managers/managers.dart';

class NewAppointmentDatesScreen extends StatefulWidget {

  static MaterialPage page() {
    return MaterialPage(
        name: Pages.newAppointmentDates,
        key: ValueKey(Pages.newAppointmentDates),
        child: const NewAppointmentDatesScreen()
    );
  }

  const NewAppointmentDatesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => _NewAppointmentDatesState();
}

class _NewAppointmentDatesState extends State<NewAppointmentDatesScreen> {


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
    );
  }

}