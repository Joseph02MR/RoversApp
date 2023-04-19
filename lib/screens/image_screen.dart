import 'package:api_project/models/rover_photo.dart';
import 'package:api_project/widgets/card_detail.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageScreen extends StatelessWidget {
  ImageScreen({super.key});
  RoverPhoto? roverPhoto;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      roverPhoto = ModalRoute.of(context)!.settings.arguments as RoverPhoto;
    }
    return Scaffold(
        body: CardDetail(
      [
        /* Text(
          'Get ready for the trip of a lifetime.',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          'Synergy Holidays is a way for you to holiday, and really enjoy it.',
          textAlign: TextAlign.center,
        ),
        */
        const Padding(
          padding: EdgeInsets.only(left: 30, bottom: 20),
          child: Text(
            'Image Data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Table(
            children: [
              TableRow(children: [
                const Text('Rover',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                Text(
                  roverPhoto!.rover,
                  style: const TextStyle(fontSize: 17),
                )
              ]),
              TableRow(children: [
                const Text('Camera',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                Text(
                  roverPhoto!.cameraFull,
                  style: const TextStyle(fontSize: 17),
                )
              ]),
              TableRow(children: [
                const Text('Date',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                Text(
                  roverPhoto!.earthDate,
                  style: const TextStyle(fontSize: 17),
                )
              ]),
              TableRow(children: [
                const Text(
                  'Sol ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '${roverPhoto!.sol}',
                  style: const TextStyle(fontSize: 17),
                )
              ]),
            ],
            columnWidths: Map.from(
                {0: const FlexColumnWidth(1), 1: const FlexColumnWidth(3.5)}),
            textBaseline: TextBaseline.alphabetic,
          ),
        )
      ],
    ));
  }
}
