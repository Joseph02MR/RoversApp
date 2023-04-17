import 'dart:convert';

import 'package:api_project/models/rover.dart';
import 'package:api_project/models/rover_photo.dart';
import 'package:http/http.dart' as http;

class MarsRoverPhotos {
  Uri? photosLink;
  Uri? roverLink;
  Uri? latestLink;
  String key = 'wIkyDZByfsnLXZWHt3nK3lPGwfXQFfTAMjd2Nnw9';

  MarsRoverPhotos.latest(String rover) {
    latestLink = Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/latest_photos?API_KEY=$key');
    roverLink = Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/manifests/$rover?API_KEY=$key');
  }

  MarsRoverPhotos(String rover, String camera, String? date, String? sol) {
    latestLink = Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/latest_photos?API_KEY=$key');
    roverLink = Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/manifests/$rover?API_KEY=$key');
    if (sol != '') {
      if (camera != '') {
        camera = '&camera=$camera';
      }
      photosLink = Uri.parse(
          'https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/photos?sol=$sol$camera&api_key=$key');
    } else {
      if (camera != '') {
        camera = '&camera=$camera';
      }
      photosLink = Uri.parse(
          'https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/photos?earth_date=$date$camera&api_key=$key');
    }
  }

  Future<Rover?> getRover() async {
    var result = await http.get(roverLink!);
    var listJson =
        jsonDecode(result.body)['photo_manifest'] as Map<String, dynamic>;
    if (result.statusCode == 200) {
      return Rover.fromMap(listJson);
    }
    return null;
  }

  Future<List<RoverPhoto>?> getRoverPhotos() async {
    var result = await http.get(photosLink!);
    var listJson = jsonDecode(result.body)['photos'] as List;
    if (result.statusCode == 200) {
      return listJson.map((photos) => RoverPhoto.fromMap(photos)).toList();
    }
    return null;
  }

  Future<List<RoverPhoto>?> getRoverLatest(String rover) async {
    var listJson;
    var result = await http.get(latestLink!);
    if (rover == 'opportunity' || rover == 'spirit') {
      Rover? rover_aux = await getRover();
      if (rover_aux != null) {
        result = await http.get(Uri.parse(
            'https://api.nasa.gov/mars-photos/api/v1/rovers/$rover/photos?api_key=$key&sol=${rover_aux.maxSol}'));
        listJson = jsonDecode(result.body)['photos'] as List;
      }
    } else {
      listJson = jsonDecode(result.body)['latest_photos'] as List;
    }
    if (result.statusCode == 200) {
      return listJson.map((photos) => RoverPhoto.fromMap(photos))();
    }
    return null;
  }
}
