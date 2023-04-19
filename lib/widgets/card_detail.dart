// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:api_project/models/rover_photo.dart';
import 'package:api_project/settings/styles_settings.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  final List<Widget> children;
  RoverPhoto? roverPhoto;

  CardDetail(
    this.children, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      roverPhoto = ModalRoute.of(context)!.settings.arguments as RoverPhoto;
    }
    return Container(
      color: darkPurple,
      // color: Colors.blueAccent,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: lightPurple,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: NetworkImage(roverPhoto!.imgSrc),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: const Color.fromARGB(255, 75, 15, 94),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
