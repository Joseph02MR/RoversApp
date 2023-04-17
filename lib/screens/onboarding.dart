import 'package:flutter/material.dart';
import 'package:api_project/widgets/enticer.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class HolidayType {
  final String asset;
  final String name;

  HolidayType(this.asset, this.name);
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool acceptedLicense = false;
  final outerScrollController = PageController();
  // final innerScrollController = PageController();
  double innerScrollPosition = 0;
  // final innerScrollController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            // Root PageView
            controller:
                outerScrollController, // The scroll controller that is used to programatically scroll the PageView
            physics:
                const NeverScrollableScrollPhysics(), // Prevent the user from swiping
            scrollDirection: Axis.horizontal,
            children: [
          ClipRect(
            // Prevent children from overflowing from the container
            child: EnticerOpenerPage(
              getStartedPressed: () => outerScrollController.animateToPage(
                1, // When the user presses the button, scroll down to the onboarding process.
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ),
          ),
        ]));
  }
}
