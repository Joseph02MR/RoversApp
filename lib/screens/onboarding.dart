import 'package:api_project/provider/theme_provider.dart';
import 'package:api_project/settings/styles_settings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:api_project/widgets/enticer.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
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
                NeverScrollableScrollPhysics(), // Prevent the user from swiping
            scrollDirection: Axis.horizontal,
            children: [
          ClipRect(
            // Prevent children from overflowing from the container
            child: EnticerOpenerPage(
              getStartedPressed: () => outerScrollController.animateToPage(
                1, // When the user presses the button, scroll down to the onboarding process.
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ),
          ),
        ]));
  }
}
