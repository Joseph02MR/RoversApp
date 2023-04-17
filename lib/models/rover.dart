class Rover {
  Rover(
      {required this.name,
      required this.launchDate,
      required this.landingDate,
      required this.status,
      required this.maxDate,
      required this.maxSol,
      required this.totalPhotos}) {
    setCameras(name);
  }

  String name;
  DateTime launchDate;
  DateTime landingDate;
  String status;
  int maxSol;
  DateTime maxDate;
  int totalPhotos;
  late List<String> cameras;

  static final List<String> curiosityCameras = List.from(
      {'FHAZ', 'RHAZ', 'MAST', 'CHEMCAM', 'MAHLI', 'MARDI', 'NAVCAM'});
  static final List<String> opportunityCameras =
      List.from({'FHAZ', 'RHAZ', 'NAVCAM', 'PANCAM', 'MINITES'});
  static final List<String> spiritCameras =
      List.from({'FHAZ', 'RHAZ', 'NAVCAM', 'PANCAM', 'MINITES'});
  static final List<String> perseveranceCameras = List.from({
    'EDL_RUCAM',
    'EDL_RDCAM',
    'EDL_DDCAM',
    'EDL_PUCAM1',
    'EDL_PUCAM2',
    'NAVCAM_LEFT',
    'NAVCAM_RIGHT',
    'MCZ_RIGHT',
    'MCZ_LEFT',
    'FRONT_HAZCAM_LEFT_A',
    'FRONT_HAZCAM_RIGHT_A',
    'REAR_HAZCAM_LEFT',
    'REAR_HAZCAM_RIGHT',
    'SKYCAM',
    'SHERLOC_WATSON'
  });

  static final Map<String, String> camerasFullName = Map.from({
    'EDL_RUCAM': 'Rover Up-Look Camera',
    'EDL_RDCAM': 'Rover Down-Look Camera',
    'EDL_DDCAM': 'Descent Stage Down-Look Camera',
    'EDL_PUCAM1': 'Parachute Up-Look Camera A',
    'EDL_PUCAM2': 'Parachute Up-Look Camera B',
    'NAVCAM_LEFT': 'Navigation Camera - Left',
    'NAVCAM_RIGHT': 'Navigation Camera - Right',
    'MCZ_RIGHT': 'Mast Camera Zoom - Right',
    'MCZ_LEFT': 'Mast Camera Zoom - Left',
    'FRONT_HAZCAM_LEFT_A': 'Front Hazard Avoidance Camera - Left',
    'FRONT_HAZCAM_RIGHT_A': 'Front Hazard Avoidance Camera - Right',
    'REAR_HAZCAM_LEFT': 'Rear Hazard Avoidance Camera - Left',
    'REAR_HAZCAM_RIGHT': 'Rear Hazard Avoidance Camera - Right',
    'SKYCAM': 'MEDA Skycam',
    'SHERLOC_WATSON': 'SHERLOC WATSON Camera',
    'FHAZ': 'Front Hazard Avoidance Camera',
    'RHAZ': 'Rear Hazard Avoidance Camera',
    'MAST': 'Mast Camera',
    'CHEMCAM': 'Chemistry and Camera Complex',
    'MAHLI': 'Mars Hand Lens Imager',
    'MARDI': 'Mars Descent Imager',
    'NAVCAM': 'Navigation Camera',
    'PANCAM': 'Panoramic Camera',
    'MINITES': 'Miniature Thermal Emission Spectrometer (Mini-TES)',
  });

  factory Rover.fromMap(Map<String, dynamic> map) {
    return Rover(
      name: map['name'],
      landingDate: DateTime.parse(map['landing_date']),
      launchDate: DateTime.parse(map['launch_date']),
      status: map['status'],
      maxSol: map['max_sol'],
      maxDate: DateTime.parse(map['max_date']),
      totalPhotos: map['total_photos'],
    );
  }

  void setCameras(name) {
    switch (name) {
      case 'curiosity':
        cameras = Rover.curiosityCameras;
      case 'opportunity':
        cameras = Rover.opportunityCameras;
      case 'spirit':
        cameras = Rover.spiritCameras;
      case 'perseverance':
        cameras = Rover.perseveranceCameras;
    }
  }
}
