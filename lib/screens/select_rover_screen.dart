import 'package:api_project/widgets/image_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SelectRoverScreen extends StatelessWidget {
  const SelectRoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> map1 = {'rover': 'curiosity', 'ext': 'jpg'};
    Map<String, String> map2 = {'rover': 'opportunity', 'ext': 'jpg'};
    Map<String, String> map3 = {'rover': 'spirit', 'ext': 'jpg'};
    Map<String, String> map4 = {'rover': 'perseverance', 'ext': 'png'};

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: LottieBuilder.asset("assets/animations/bg-1.json"),
          ),
          ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    child: Text(
                      'Select a Rover',
                    ),
                  ),
                ),
              ),
              ImageButton(
                imagePath: 'assets/images/curiosity_concept.jpg',
                text: 'Curiosity',
                color: Colors.greenAccent,
                params: map1,
              ),
              ImageButton(
                  imagePath: 'assets/images/opportunity_concept.jpg',
                  text: 'Opportunity',
                  color: Colors.blueAccent,
                  params: map2),
              ImageButton(
                  imagePath: 'assets/images/spirit_concept.jpg',
                  text: 'Spirit',
                  color: Colors.redAccent,
                  params: map3),
              ImageButton(
                  imagePath: 'assets/images/perseverance_concept.png',
                  text: 'Perseverance',
                  color: Colors.amber,
                  params: map4),
            ],
          ),
        ],
      ),
    );
  }
}
