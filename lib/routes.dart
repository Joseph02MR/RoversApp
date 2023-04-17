import 'package:api_project/screens/data_screen.dart';
import 'package:api_project/screens/gallery_screen.dart';
import 'package:api_project/screens/image_screen.dart';
import 'package:api_project/screens/rover_menu_screen.dart';
import 'package:api_project/screens/select_rover_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/main': (BuildContext context) => const SelectRoverScreen(),
    '/rover': (BuildContext context) => const RoverMenuScreen(),
    '/data': (BuildContext context) => DataScreen(),
    '/image': (BuildContext context) => ImageScreen(),
    '/gallery': (BuildContext context) => const GalleryScreen(),
  };
}
