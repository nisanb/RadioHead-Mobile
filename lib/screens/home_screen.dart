import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/models/station.dart';
import 'package:radiohead/widgets/station_widget.dart';

import 'bottom_player.dart';

class HomeScreen extends StatelessWidget {
  static String ROUTE = '/main';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StationsView(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 100.0,
              child: BottomBar(),
            ),
          ],
        ),
      ],
    );
  }
}

class StationsView extends StatefulWidget {
  @override
  _StationsViewState createState() => _StationsViewState();
}

class _StationsViewState extends State<StationsView> {
  List<Widget> stations = [];

  void updateStations(List<Station> receivedStations) {
    setState(() {
      stations = [];
      for (Station station in receivedStations) {
        stations.add(StationWidget(
          station: station,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<FireBaseController>(context).parseStations();
    print("Loading stations");
    Provider.of<MainController>(context)
        .stationsController
        .getStations(callback: updateStations);

    if (stations.length == 0) {
      return Center(child: CircularProgressIndicator());
    }

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: stations,
    );
  }
}
