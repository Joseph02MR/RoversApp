class Rover {
  Rover(
      {required this.name,
      required this.launchDate,
      required this.landingDate,
      required this.status,
      required this.maxDate,
      required this.maxSol,
      required this.totalPhotos}) {
    cameras = setCameras(name);
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

  static final Map<String, String> camerasColor = Map.from({
    'EDL_RUCAM': '464531',
    'EDL_RDCAM': 'EFA94A',
    'EDL_DDCAM': '6A5F31',
    'EDL_PUCAM1': 'CDA434',
    'EDL_PUCAM2': '3E3B32',
    'NAVCAM_LEFT': '1B5583',
    'NAVCAM_RIGHT': 'C6A664',
    'MCZ_RIGHT': '2E3A23',
    'MCZ_LEFT': 'F75E25',
    'FRONT_HAZCAM_LEFT_A': '1E2460',
    'FRONT_HAZCAM_RIGHT_A': '8E402A',
    'REAR_HAZCAM_LEFT': '4E5754',
    'REAR_HAZCAM_RIGHT': '75151E',
    'SKYCAM': '343B29',
    'SHERLOC_WATSON': 'C93C20',
    'FHAZ': 'F4F4F4',
    'RHAZ': 'E4A010',
    'MAST': '6A5D4D',
    'CHEMCAM': '642424',
    'MAHLI': '382C1E',
    'MARDI': 'CB3234',
    'NAVCAM': '00BB2D',
    'PANCAM': '4E3B31',
    'MINITES': '763C28',
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

  List<String> setCameras(name) {
    switch (name) {
      case 'Curiosity':
        return Rover.curiosityCameras;
      case 'Opportunity':
        return Rover.opportunityCameras;
      case 'Spirit':
        return Rover.spiritCameras;
      case 'Perseverance':
        return Rover.perseveranceCameras;
      default:
        return List.empty(growable: false);
    }
  }
}
