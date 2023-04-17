import 'package:api_project/provider/rover_data_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataScreen extends StatelessWidget {
  DataScreen({super.key});
  RoverDataProvider? roverData;

  RoverDataProvider getRoverData(String rover) {
    switch (rover) {
      case 'curiosity':
        return RoverDataProvider.initData(1)!;
      case 'opportunity':
        return RoverDataProvider.initData(2)!;
      case 'spirit':
        return RoverDataProvider.initData(3)!;
      case 'perseverance':
        return RoverDataProvider.initData(4)!;
      default:
        return RoverDataProvider.initData(5)!;
    }
  }

  List<Widget> insertData(List<String> data) {
    List<Widget> texts = List.empty(growable: true);
    for (var element in data) {
      texts.add(Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            element,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ));
    }
    return texts;
  }

  Widget insertDetailsTable(Map<String, dynamic> data) {
    List<TableRow> tableRows = List.empty(growable: true);
    for (var element in data.entries) {
      if (element.value.runtimeType == List<dynamic>) {
        List<Widget> elementData = List.empty(growable: true);
        for (var element in element.value) {
          elementData.add(Text(element));
        }

        tableRows.add(TableRow(children: [
          Text(
            element.key,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Column(
            children: elementData,
          )
        ]));
      } else {
        tableRows.add(TableRow(children: [
          Text(
            element.key,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(element.value)
        ]));
      }
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Table(
        children: tableRows,
        border: TableBorder.all(width: 0.5, color: Colors.white),
        columnWidths: Map.from(
            {0: const FlexColumnWidth(1), 1: const FlexColumnWidth(3)}),
        textBaseline: TextBaseline.alphabetic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String>? data;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      roverData = getRoverData(data['rover']!);
    }
    return Scaffold(
        body: Stack(
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Color.fromARGB(255, 1, 1, 1),
            BlendMode.dstOut,
          ),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${data!["rover"]}_concept.${data['ext']}'),
                    fit: BoxFit.cover)),
          ),
        ),
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 150,
                      minHeight: 200,
                      minWidth: 150),
                  child: Image(
                      image: AssetImage(
                          'assets/images/${data["rover"]}_concept.${data['ext']}')),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Text(
                          data['rover']!.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black,
                        backgroundBlendMode: BlendMode.softLight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Description',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              roverData!.description,
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Firsts',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        roverData!.firsts != null
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: insertData(roverData!.firsts!),
                                ))
                            : const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'None available',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'KeyDates',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: insertData(roverData!.keyDates),
                            )),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, right: 10),
                          child: Text(
                            'Additional information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        insertDetailsTable(roverData!.details)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
