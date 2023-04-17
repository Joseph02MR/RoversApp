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
  bool useDate = false;

  TextEditingController date = TextEditingController();
  TextEditingController sol = TextEditingController();
  String camera = '';
  int _dummy = 1;

  void updateRover() async {
    rover = await api.getRover();
    setState(() {});
  }

  Future<List<RoverPhoto>?>? _future() {
    if (_dummy > 0) {
      return api.photosLink != null
          ? api.getRoverPhotos()
          : api.getRoverLatest(data!['rover']!);
    }
    return null;
  }

  List<DropdownMenuItem> comboOptionsFill(rover) {
    List aux;
    switch (rover) {
      case 'curiosity':
        aux = Rover.curiosityCameras;
        break;
      case 'opportunity':
        aux = Rover.opportunityCameras;
        break;
      case 'spirit':
        aux = Rover.spiritCameras;
        break;
      case 'perseverance':
        aux = Rover.perseveranceCameras;
        break;
      default:
        aux = List.empty(growable: true);
    }
    List<DropdownMenuItem> options = List.empty(growable: true);
    options.add(const DropdownMenuItem(
      value: '',
      child: Text('Select a camera'),
    ));
    for (var element in aux) {
      options.add(DropdownMenuItem(
        value: element,
        child: SizedBox(
          width: 250,
          child: Text(Rover.camerasFullName[element]!),
        ),
      ));
    }
    return options;
  }

  Future<void> _selectDate(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(const Duration(days: 1)),
        firstDate: rover!.landingDate,
        lastDate: rover!.maxDate);
    if (picked != null) {
      setState(() {
        date.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  bool validate() {
    if (camera == 'Select a camera') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Camera is missing')));
      return false;
    }
    if (useDate && date.text == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Date is missing')));
      return false;
    } else if (!useDate && sol.text == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sol is missing')));
      return false;
    }
    return true;
  }

  void setApiData() {
    if (validate()) {
      setState(() {
        _dummy++;
        if (useDate) {
          api =
              MarsRoverPhotos(rover!.name, camera.toLowerCase(), date.text, '');
        } else {
          api =
              MarsRoverPhotos(rover!.name, camera.toLowerCase(), '', sol.text);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      api = MarsRoverPhotos.latest(data!['rover']!);
      updateRover();
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: lightPurple),
      drawer: Drawer(
        width: 300,
        backgroundColor: Colors.blueGrey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text('Camera'),
                  DropdownButton(
                    items: comboOptionsFill(data!['rover']),
                    value: camera,
                    onChanged: (value) {
                      setState(() {
                        camera = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              title: const Text('Use Date for search'),
              leading: Radio<bool>(
                value: true,
                groupValue: useDate,
                onChanged: (bool? value) {
                  setState(() {
                    useDate = value!;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              title: const Text('Use Sol data for search'),
              leading: Radio<bool>(
                value: false,
                groupValue: useDate,
                onChanged: (bool? value) {
                  setState(() {
                    useDate = value!;
                  });
                },
              ),
            ),
            useDate
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            iconSize: 30,
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                        TextField(
                          decoration: const InputDecoration(
                              hintText: 'Select date',
                              constraints: BoxConstraints(maxWidth: 200)),
                          controller: date,
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Sol'),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Select sol',
                              helperText:
                                  'Max sol: ${rover != null ? rover!.maxSol : ''}',
                              constraints: const BoxConstraints(maxWidth: 200)),
                          controller: sol,
                        )
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setApiData();
                      },
                      child: const Text('Search')),
                ],
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder(
          future: _future(),
          builder: (context, AsyncSnapshot<List<RoverPhoto>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: .9,
                    mainAxisSpacing: 5),
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
