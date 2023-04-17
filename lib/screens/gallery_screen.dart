import 'package:api_project/api/mars_rover_photo_api.dart';
import 'package:api_project/models/rover.dart';
import 'package:api_project/models/rover_photo.dart';
import 'package:api_project/settings/styles_settings.dart';
import 'package:api_project/widgets/rover_card.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late MarsRoverPhotos api;
  Rover? rover;
  Map<String, String>? data;

  void updateRover() async {
    rover = await api.getRover();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      api = MarsRoverPhotos.latest(data!['rover']!);
      updateRover();
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: darkPurple),
      drawer: Drawer(
        child: ListView(
          children: [
            Row(
              children: [],
            )
          ],
        ),
      ),
      body: FutureBuilder(
          future: api.photosLink != null
              ? api.getRoverPhotos()
              : api.getRoverLatest(),
          builder: (context, AsyncSnapshot<List<RoverPhoto>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: .99,
                    mainAxisSpacing: 1),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  return RoverCard(roverPhoto: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Ocurrio un error'),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
