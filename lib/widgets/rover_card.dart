import 'package:api_project/models/rover_photo.dart';
import 'package:api_project/screens/image_screen.dart';
import 'package:flutter/material.dart';

class RoverCard extends StatelessWidget {
  const RoverCard({super.key, required this.roverPhoto});
  final RoverPhoto roverPhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
            onTap: () {
              // Navigator.of(context, rootNavigator: true)
              //    .pushNamed('/popular_details', arguments: widget.model);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ImageScreen()),
              );
            },
            child: Hero(
              tag: 'photo_${roverPhoto.id}',
              child: FadeInImage(
                fit: BoxFit.fill,
                placeholder: const AssetImage('assets/images/project.png'),
                image: NetworkImage(roverPhoto.imgSrc),
              ),
            )),
      ],
    );
  }
}
