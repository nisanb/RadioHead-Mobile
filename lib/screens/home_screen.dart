import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/models/station.dart';
import 'package:radiohead/widgets/station_widget.dart';

class HomeScreen extends StatelessWidget {
  static String ROUTE = '/main';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(flex: 5, child: StationsView()),
        Expanded(
          flex: 1,
          child: StreamBuilder<Station>(
              stream: Provider.of<MainController>(context)
                  .radioController
                  .getStationStream,
              builder: (context, snapshot) {
                return BottomBar(
                  station: snapshot.data,
                );
              }),
        ),
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  final Station station;
  BottomBar({this.station});

  Widget get stationIcon => station != null
      ? ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            station.imageURL,
            scale: 8,
          ))
      : Icon(Icons.music_note);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(100.0), topLeft: Radius.circular(100.0)),
      child: Container(
          color: Colors.black54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.play_circle_filled),
              stationIcon,
            ],
          )),
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
