import 'package:api_project/widgets/image_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RoverMenuScreen extends StatelessWidget {
  const RoverMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String rover = "";
    if (ModalRoute.of(context)!.settings.arguments != null) {
      rover = ModalRoute.of(context)!.settings.arguments as String;
    }
    return Stack(
      children: [
        Center(
          child: LottieBuilder.asset("assets/animations/bg-2.json"),
        ),
        ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
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
            const ImageButton(
              imagePath: 'assets/images/curiosity_concept.jpg',
              text: 'Rover\'s Data',
              color: Color.fromARGB(255, 44, 51, 109),
            ),
            const ImageButton(
                imagePath: 'assets/images/curiosity_concept.jpg',
                text: 'Get Random Image',
                color: Color.fromARGB(255, 44, 51, 109)),
            const ImageButton(
                imagePath: 'assets/images/curiosity_concept.jpg',
                text: 'Gallery',
                color: Color.fromARGB(255, 44, 51, 109)),
          ],
        ),
      ],
    );
  }
}
