import 'package:assignment2/Models/jsonData.dart';
import 'package:assignment2/Screens/list.dart';
import 'package:assignment2/Services/jsonlist.dart';
import 'package:assignment2/router_Constants.dart';
import 'package:flutter/material.dart';
import 'package:assignment2/Utils/customExtension.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  _activateValidator() {
    _formKey.currentState.validate();
  }

  Widget _getCountryField() {
    return TextFormField(
      controller: _countryController,
      decoration: InputDecoration(
        hintText: 'Enter Country Name',
      ),
      textAlign: TextAlign.center,
      onChanged: (text) {
        _activateValidator();
      },
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Please Enter Country Name';
        }
        return null;
      },
    );
  }

  Widget _getStateField() {
    return TextFormField(
      controller: _stateController,
      decoration: InputDecoration(
        hintText: 'Enter State Name',
      ),
      textAlign: TextAlign.center,
      onChanged: (text) {
        _activateValidator();
      },
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Please Enter state Name';
        }
        return null;
      },
    );
  }

  Widget _getCityField() {
    return TextFormField(
      controller: _cityController,
      decoration: InputDecoration(
        hintText: 'Enter City Name',
      ),
      textAlign: TextAlign.center,
      onChanged: (text) {
        _activateValidator();
      },
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Please Enter City Name';
        }
        return null;
      },
    );
  }

  _clearControllers() {
    _countryController.clear();
    _cityController.clear();
    _stateController.clear();
  }

  Widget _submitButton() {
    return RaisedButton(
      color: Colors.blue[200],
      onPressed: () {
        if (_formKey.currentState.validate()) {
          var jsonDataFormat = {
            "countryName": _countryController.text,
            "stateName": _stateController.text,
            "cityName": _cityController.text,
          };
          JsonData _jsonData=JsonData.fromJson(jsonDataFormat);
          jsonList.add(_jsonData);
          _clearControllers();
        }
      },
      child: Text('Submit'),
    );
  }

  Widget _showCountriesButton() {
    return RaisedButton(
      color: Colors.blue[200],
      onPressed: () {
        print(jsonList);
        Navigator.pushNamed(context,LIST);
      },
      child: Text('Show Countries'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getCountryField().addPadding(),
            _getStateField().addPadding(),
            _getCityField().addPadding(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_submitButton(), _showCountriesButton()],
            ).addPadding()
          ],
        ),
      ),
    );
  }
}
