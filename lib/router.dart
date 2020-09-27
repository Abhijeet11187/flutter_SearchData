import 'package:assignment2/Screens/formScreen.dart';
import 'package:assignment2/Screens/list.dart';
import 'package:assignment2/router_Constants.dart';
import 'package:flutter/material.dart';

RouteFactory routes() {
  return (settings) {
    Widget screen;
    switch (settings.name) {
      case ROOT:
        screen = FormScreen();
        break;
      case LIST:
        screen = ListElements();
        break;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}