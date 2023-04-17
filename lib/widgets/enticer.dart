import 'dart:async';
import 'package:flutter/material.dart';

class EnticerOpenerPage extends StatefulWidget {
  final VoidCallback getStartedPressed;

  const EnticerOpenerPage({
    Key? key,
    required this.getStartedPressed,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EnticerOpenerPageState createState() => _EnticerOpenerPageState();
}

class _EnticerOpenerPageState extends State<EnticerOpenerPage> {
  final List<String> textOpeners = [
    'HELLO',
    'WELCOME',
    'TO',
    'MARS',
    'HELLO,\r\nWELCOME\r\nTO\r\nMARS'
  ];

  int index = 1;
  bool showStartCard = false;

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        setState(() {
          if (index == 5) {
            timer.cancel();
            setState(() {
              showStartCard = true;
            });
          } else {
            index++;
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 2000),
      child: Container(
        key: ValueKey<int>(index),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/slide$index.jpg',
            ),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                textOpeners[index - 1],
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
              ),
            ),
            if (index == 5)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: showStartCard ? 1 : 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(80.0).copyWith(bottom: 120),
                    child: BottomTextInvite(
                      getStartedPressed: widget.getStartedPressed,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class BottomTextInvite extends StatelessWidget {
  final VoidCallback getStartedPressed;
  const BottomTextInvite({
    Key? key,
    required this.getStartedPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Theme.of(context).cardColor.withOpacity(0.7),
      // shadowColor: Colors.black.withOpacity(0.3),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text("Prepare to holiday"),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.titleLarge,
                children: const [
                  TextSpan(
                      text: 'Enjoy the space',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: ' now.',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
              child: const Text('GET STARTED'),
            ),
          ],
        ),
      ),
    );
  }
}
