import 'package:api_project/widgets/image_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RoverMenuScreen extends StatelessWidget {
  const RoverMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String rover = "";
    String fileType = "";
    late Map<String, String> map1;
    late Map<String, String> params;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      params =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      rover = params['rover']!;
      fileType = params['ext']!;
    }

    if (rover != 'perseverance') {
      map1 = {'screen': 'data', 'rover': rover, 'ext': 'jpg'};
    } else {
      map1 = {'screen': 'data', 'rover': rover, 'ext': 'png'};
    }
    Map<String, String> map2 = {'screen': 'image', 'rover': rover};
    Map<String, String> map3 = {'screen': 'gallery', 'rover': rover};

    return Stack(
      children: [
        Center(
          child: LottieBuilder.asset("assets/animations/bg-2.json"),
        ),
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  child: Text(
                    rover.toUpperCase(),
                  ),
                ),
              ),
            ),
            ImageButton(
              imagePath: 'assets/images/${rover}_concept.$fileType',
              text: 'Rover\'s Data',
              color: const Color.fromARGB(255, 44, 51, 109),
              params: map1,
            ),
            ImageButton(
              imagePath: 'assets/images/${rover}_concept.$fileType',
              text: 'Get Random Image',
              color: const Color.fromARGB(255, 44, 51, 109),
              params: map2,
            ),
            ImageButton(
                imagePath: 'assets/images/${rover}_concept.$fileType',
                text: 'Gallery',
                color: const Color.fromARGB(255, 44, 51, 109),
                params: map3),
          ],
        ),
      ],
    );
  }
}
