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
  final TextEditingController _placeFieldController = TextEditingController();
  final TextEditingController _diseaseFieldController = TextEditingController();
  final TextEditingController _manufacturerFieldController = TextEditingController();

  int _selectedCityId = 0;
  int _selectedPlaceId = 0;
  int _selectedDiseaseId = 0;
  int _selectedVaccineId = 0;

  List<Vaccine> _vaccines = [];
  List<Manufacturer> _manufacutrers = [];
  List<Place> _places = [];
  final List<Disease> _diseases = [];

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
                    const SizedBox(height: 20),
                    const Text('Na co chcesz się zaszczepić?', style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 10),
                    TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _diseaseFieldController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),

                            ),
                            labelText: 'Choroba',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                        ),
                      ),
                      suggestionsCallback: (String pattern) async {
                        String _enteredDisease = _diseaseFieldController.text;
                        List<Disease> diseases = await APIService.getDiseaseSuggestions(_enteredDisease);

                        return diseases;
                      },
                      itemBuilder: (context, Disease suggestion) {
                        return ListTile(
                          title: Text(suggestion.name),
                        );
                      }, onSuggestionSelected: (Disease suggestion) async {
                      _selectedDiseaseId = suggestion.id;
                      _diseaseFieldController.text = suggestion.name;
                      _manufacutrers = await APIService.getManufacturerSuggestions(_selectedDiseaseId);
                    },
                    ),
                    const SizedBox(height: 20),
                    const Text('Wybierz producenta', style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 10),
                    TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _manufacturerFieldController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),

                            ),
                            labelText: 'Producent',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                        ),
                      ),
                      suggestionsCallback: (String pattern) {
                        return _manufacutrers;
                      },
                      itemBuilder: (context, Manufacturer suggestion) {
                        return ListTile(
                          title: Text(suggestion.name),
                        );
                      }, onSuggestionSelected: (Manufacturer suggestion) {
                      _selectedVaccineId = suggestion.id;
                      _manufacturerFieldController.text = suggestion.name;
                    },
                    ),
                    const SizedBox(height: 20),
                    const Text('Wprowadź miasto', style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 10),
                    TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _cityFieldController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),

                            ),
                            labelText: 'Wprowadź miasto',
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
                        _placeFieldController.clear();
                    },
                    ),
                    const SizedBox(height: 20),
                    const Text('Wybierz placówke', style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 10),
                    TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: this._placeFieldController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),

                            ),
                            labelText: 'Wybierz placówke',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                        ),
                      ),
                      suggestionsCallback: (String pattern) {
                        return _places;
                      },
                      itemBuilder: (context, Place suggestion) {
                        return ListTile(
                          title: Text(suggestion.name),
                        );
                      }, onSuggestionSelected: (Place suggestion) {
                      _selectedPlaceId = suggestion.id;
                      _placeFieldController.text = suggestion.name;
                    },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white24,
                            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            shape: const StadiumBorder()
                        ),
                        onPressed: ()  async {
                          //TODO: Check if fields are completed
                          Provider.of<VisitsManager>(context, listen: false).goToDatesScreen(_selectedPlaceId, _selectedVaccineId);
                          },
                        child: const Text("Zobacz terminy", style: TextStyle(fontSize: 14))
                    ),
                  ],
                ),
              ),
          )
    );
  }

}