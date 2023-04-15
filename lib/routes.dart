import 'package:api_project/screens/rover_menu_screen.dart';
import 'package:api_project/screens/select_rover_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/main': (BuildContext context) => const SelectRoverScreen(),
    '/rover': (BuildContext context) => const RoverMenuScreen(),
  };
}
