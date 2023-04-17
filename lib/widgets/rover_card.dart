import 'package:api_project/models/rover.dart';
import 'package:api_project/models/rover_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class RoverCard extends StatelessWidget {
  const RoverCard({super.key, required this.roverPhoto});
  final RoverPhoto roverPhoto;

  Widget _content({Color? color}) {
    return Text(
      roverPhoto.cameraFull,
      style: TextStyle(color: color),
    );
  }

  Widget _content2({Color? color}) {
    return Text(
      roverPhoto.earthDate,
      style: TextStyle(color: color),
    );
  }

  Widget _tag(String tag, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(
                int.parse('0xFF${Rover.camerasColor[roverPhoto.camera]}'))),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: Text(
          tag,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            // Navigator.of(context, rootNavigator: true)
            //    .pushNamed('/popular_details', arguments: widget.model);
            Navigator.pushNamed(context, '/image', arguments: roverPhoto);
          },
          child: TransparentImageCard(
            width: 200,
            height: 300,
            imageProvider: NetworkImage(roverPhoto.imgSrc),
            tags: [
              _tag(roverPhoto.camera, () {}),
            ],
            title: _content(color: Colors.white),
            description: _content2(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
