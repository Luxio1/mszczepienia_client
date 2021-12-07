import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mszczepienia_client/helpers/mycolors.dart';
import 'package:mszczepienia_client/services/api_service.dart';
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

  final TextEditingController _cityFieldController = TextEditingController();
  int _selectedCityId = 0;
  int _selectedPlaceId = 0;
  List<Place> _places = [];

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
      body: Form(
              child: Padding(padding: EdgeInsets.all(32.0),
                child: Column (
                  children: <Widget>[
                    Text('Wprowadź miasto'),
                    const SizedBox(height: 20),
                    TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: this._cityFieldController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),

                            ),
                            labelText: 'Hasło',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                        ),
                      ),
                      suggestionsCallback: (String pattern) async {
                        String _enteredCity = _cityFieldController.text;
                        List<City> cities = await APIService.getCitiesSuggestions(_enteredCity);

                        return cities;
                      },
                      itemBuilder: (context, City suggestion) {
                        return ListTile(
                          title: Text(suggestion.name),
                        );
                      }, onSuggestionSelected: (City suggestion) async {
                        _selectedCityId = suggestion.id;
                        _cityFieldController.text = suggestion.name;
                        _places = await APIService.getPlacesSuggestions(_selectedCityId);
                    },
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white24,
                            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            shape: const StadiumBorder()
                        ),
                        onPressed: ()  async {
                          //TODO: add visit reservation
                          },
                        child: const Text("Rezerwuj", style: TextStyle(fontSize: 14))
                    ),
                  ],
                ),
              ),
          )
    );
  }

}