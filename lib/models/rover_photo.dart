class RoverPhoto {
  int id;
  int sol;
  String earthDate;
  String rover;
  String camera;
  String cameraFull;
  String imgSrc;

  RoverPhoto(
      {required this.id,
      required this.rover,
      required this.camera,
      required this.cameraFull,
      required this.imgSrc,
      required this.earthDate,
      required this.sol});

  factory RoverPhoto.fromMap(Map<String, dynamic> map) {
    return RoverPhoto(
      id: map['id'],
      sol: map['sol'],
      earthDate: map['earth_date'],
      rover: map['rover']['name'],
      camera: map['camera']['name'],
      cameraFull: map['camera']['full_name'],
      imgSrc: map['img_src'],
    );
  }
}
