class RoverDataProvider {
  String name;
  String description;
  Map<String, dynamic> details;
  List<String>? firsts;
  List<String> keyDates;
  String link;

  RoverDataProvider(
      {required this.name,
      required this.description,
      required this.details,
      this.firsts,
      required this.keyDates,
      required this.link});

  static RoverDataProvider? initData(int option) {
    switch (option) {
      case 1:
        return RoverDataProvider(
          name: 'curiosity',
          description: ''' 
    NASA's Curiosity is the largest and most advanced rover ever sent to Mars. 
    The car-sized rover is part of NASA's Mars Science Laboratory (MSL). 
    Curiosity's ongoing mission is to study the ancient habitability and the potential for life on Mars.
    ''',
          details: Map.from({
            'Nation': 'United States of America (USA)',
            'Objective(s)': 'Mars Landing and Rover',
            'Spacecraft': 'Mars Science Lab (MSL)',
            'Spacecraft Mass': '8,583 pounds (3,893 Kg)',
            'Mission Design and Management': 'NASA/JPL',
            'Launch Vehicle': 'Atlas V 541 (AV-028 + Centaur)',
            'Launch Date and Time': 'Nov. 26, 2011 / 15:02:00 UT',
            'Launch Site': 'Cape Canaveral, Fla. / SLC-41',
            'Scientific Instruments': List.from({
              'Mast Camera (Mastcam)',
              'Mars Hand Lens Imager (MAHLI)',
              'Mars Descent Imager (MARDI)',
              'Alpha X-ray Spectrometer (APXS)',
              'Chemistry and Camera (ChemCam)',
              'Chemistry and Mineralogy X-ray Diffraction/X-ray fluorescence instrument (CheMin)',
              'Sample Analysis at Mars Instrument Suite (SAM)',
              'Radiation Assessment Detector (RAD)',
              'Dynamic Albedo of Neutrons (DAN)',
              'Rover Environment Monitoring Station (REMS)',
              'Mars Science Laboratory Entry Descent and Landing Instrument (MEDLI)})'
            })
          }),
          firsts: List.from({
            'Curiosity demonstrated new heavy-load Mars landing technologies'
          }),
          keyDates: List.from({
            'Nov. 26, 2011: Launch',
            'Aug. 6, 2012: Mars landing',
            'Aug. 29, 2012: Curiosity began its first drive'
          }),
          link: 'https://solarsystem.nasa.gov/missions/curiosity-msl/in-depth/',
        );
      case 2:
        return RoverDataProvider(
            name: 'opportunity',
            description: ''' 
      Opportunity landed on Mars in early 2004 soon after its twin rover Spirit. 
      Spirit uncovered strong evidence that Mars was once much wetter than it is now. 
      Described as a "wonderful workhorse"—Spirit operated for 6 years, 2 months, 
      and 19 days, more than 25 times its original intended lifetime. 
      The rover traveled 4.8 miles (7.73 kilometers) across the Martian plains.

    ''',
            details: Map.from({
              'Nation': 'United States of America (USA)',
              'Objective(s)': 'Mars Surface Exploration',
              'Spacecraft': 'Mars Exploration Rover 1 (MER 1) [became MER-B]',
              'Spacecraft Mass': '2,341 pounds (1,062 kilograms)',
              'Mission Design and Management': 'NASA/JPL',
              'Launch Vehicle': 'Delta 7925H (no. D299)',
              'Launch Date and Time': 'July 8, 2003 / 03:18:15 UT',
              'Launch Site': 'Cape Canaveral, Fla. / SLC-17B',
              'Scientific Instruments': List.from({
                'Panoramic Mast Assembly',
                'panoramic cameras (Pancam)',
                'navigation cameras (Navcam)',
                'miniature thermal emission spectrometer (Mini-TES)',
                'Mössbauer Spectrometer (MB)',
                'Alpha Particle X-ray Spectrometer (APXS)',
                'Magnets (to collect dust particles)',
                'Microscopic Imager (MI)',
                'Rock Abrasion Tool (RAT)'
              })
            }),
            keyDates: List.from({
              'June 10, 2003: Launch',
              'Jan. 4, 2004: Mars landing',
              'May 25, 2011: NASA officially ends efforts to contact the rover'
            }),
            link:
                'https://solarsystem.nasa.gov/missions/opportunity/in-depth/');
      case 3:
        return RoverDataProvider(
            name: 'spirit',
            description: ''' 
   NASA's Spirit rover—and it's twin Opportunity—studied the history of climate and 
   water at sites on Mars where conditions may once have been favorable to life.
   Spirit uncovered strong evidence that Mars was once much wetter than it is now. 
   Described as a "wonderful workhorse"—Spirit operated for 6 years, 2 months, and 19 days, 
   more than 25 times its original intended lifetime.
   The rover traveled 4.8 miles (7.73 kilometers) across the Martian plains.
   On May 25, 2011, NASA ended efforts to contact the marooned rover and declared its mission complete. 
   The rover had been silent since March 2010.
    ''',
            details: Map.from({
              'Nation': 'United States of America (USA)',
              'Objective(s)': 'Mars Surface Exploration',
              'Spacecraft': 'Mars Exploration Rover 2 (MER 2) [became MER-A]',
              'Spacecraft Mass': '2,341 pounds (1,062 kilograms)',
              'Mission Design and Management': 'NASA/JPL',
              'Launch Vehicle': 'Delta 7925-9.5 (no. D298)',
              'Launch Date and Time': 'June 10, 2003 / 17:58:47 UT',
              'Launch Site': 'Cape Canaveral, Fla. / SLC-17A',
              'Scientific Instruments': List.from({
                'Panoramic Mast Assembly',
                'panoramic cameras (Pancam)',
                'navigation cameras (Navcam)',
                'miniature thermal emission spectrometer (Mini-TES)',
                'Mössbauer Spectrometer (MB)',
                'Alpha Particle X-ray Spectrometer (APXS)',
                'Magnets (to collect dust particles)',
                'Microscopic Imager (MI)',
                'Rock Abrasion Tool (RAT)'
              })
            }),
            firsts: List.from({
              'First human enterprise to exceed marathon distance of travel on another world',
              'Steepest slope driven by any rover on Mars'
            }),
            keyDates: List.from({
              'June 10, 2003: Launch',
              'Jan. 4, 2004: Mars landing',
              'May 25, 2011: NASA officially ends efforts to contact the rover'
            }),
            link: 'https://solarsystem.nasa.gov/missions/spirit/in-depth/');
      case 4:
        return RoverDataProvider(
            name: 'perseverance',
            description: ''' 
   The Mars 2020 Perseverance Rover is searching for signs of ancient microbial life, which will advance NASA's quest to explore the past habitability of Mars.
   The rover has a drill to collect samples of Martian rock and soil, then store them. Perseverance will test technologies to help pave the way for human exploration of Mars.
   The Mars Helicopter, Ingenuity, rode to Mars strapped to Perseverance's belly.
   NASA's Perseverance rover is seeking signs of ancient life by studying Martian terrain that is now inhospitable but once held flowing rivers and lakes. 
   The mission includes the Ingenuity Mars Helicopter, the first rotary aircraft test on a planet beyond Earth.
    ''',
            details: Map.from({
              'Nation': 'United States of America (USA)',
              'Objective(s)': 'Mars Landing and Rover',
              'Spacecraft': 'Mars Science Lab (MSL)',
              'Spacecraft Mass': '8,583 pounds (3,893 Kg)',
              'Mission Design and Management': 'NASA',
              'Launch Date': 'July 30, 2020',
              'Scientific Instruments': List.from({
                'Mastcam-Z',
                'Mars Environmental Dynamics Analyzer (MEDA)',
                'Mars Oxygen ISRU Experiment (MOXIE)',
                'Planetary Instrument for X-ray Lithochemistry (PIXL)',
                'Radar Imager for Mars\' Subsurface Experiment (RIMFAX)',
                'Scanning Habitable Environments with Raman & Luminescence for Organics & Chemicals (SHERLOC)',
                'SuperCam',
              })
            }),
            firsts: List.from({
              'First powered flight on another planet (Ingenuity helicopter)',
              'First audio recording from another planet'
            }),
            keyDates: List.from({
              'July 30, 2020: Launch',
              'Feb. 18, 2021: Landing on Mars',
              'March 4, 2021: Perseverance rover\'s first drive on Mars',
              'April 19, 2021: First powered flight on another planet (Ingenuity helicopter)',
              'June 1, 2021: Perseverance begins first science campaign',
              'Sept. 1, 2021: Perseverance successfully cores its first Mars rock'
            }),
            link:
                'https://solarsystem.nasa.gov/missions/mars-2020-rover/in-depth/');
      default:
        return RoverDataProvider(
            name: '',
            description: '',
            details: Map.identity(),
            keyDates: List.empty(),
            link: '');
    }
  }
}
