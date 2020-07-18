import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/controllers/radio_controller.dart';
import 'package:radiohead/models/station.dart';

class BottomActionRow extends StatefulWidget {
  @override
  _BottomActionRowState createState() => _BottomActionRowState();
}

class _BottomActionRowState extends State<BottomActionRow> {
  RadioController controller;

  Widget getStationIcon(station) => station != null
      ? ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            station.imageURL,
            scale: 8,
          ))
      : Icon(Icons.music_note);

  @override
  void initState() {
    super.initState();
    controller =
        Provider.of<MainController>(context, listen: false).radioController;
  }

  Widget getActionWidget(String playerState) {
    switch (playerState) {
      case FlutterRadioPlayer.flutter_radio_stopped:
      case FlutterRadioPlayer.flutter_radio_paused:
        return SizedBox(
          width: 25.0,
          height: 25.0,
          child: IconButton(
            icon: Icon(Icons.play_circle_filled),
            onPressed: () {
              controller.playOrPause();
            },
          ),
        );
      case FlutterRadioPlayer.flutter_radio_playing:
        return SizedBox(
          width: 25.0,
          height: 25.0,
          child: IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
              controller.playOrPause();
            },
          ),
        );
      case FlutterRadioPlayer.flutter_radio_loading:
        return CircularProgressIndicator();
      case FlutterRadioPlayer.flutter_radio_error:
        return Icon(Icons.error_outline, color: Colors.red);
      default:
        return Text("N/A");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        StreamBuilder(
          stream: controller.getStateStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return getActionWidget(snapshot.data);
          },
        ),
        StreamBuilder(
          stream: controller.getStationStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            Station station = snapshot.data;
            return getStationIcon(station);
          },
        ),
      ],
    );
  }
}
