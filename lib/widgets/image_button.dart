import 'dart:collection';

import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.color,
      this.params});

  final String imagePath;
  final String text;
  final Color color;
  final Map<String, String>? params;

  void navigate(context) {
    if (params != null) {
      if (params!.containsKey('rover')) {
        Navigator.pushNamed(context, '/rover', arguments: params!['rover']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var row = InkWell(
      onTap: () {
        navigate(context);
      },
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    color,
                    BlendMode.color,
                  ),
                  child: Image.asset(
                    imagePath,
                    opacity: const AlwaysStoppedAnimation(0.5),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ))),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
    return Card(
      child: row,
    );
  }
}
