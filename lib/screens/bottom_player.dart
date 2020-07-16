import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/models/station.dart';

class BottomPlayer extends StatelessWidget {
  void registerStream(context) {
    var controller =
        Provider.of<MainController>(context, listen: false).radioController;

    controller
      ..getStationStream.listen((station) {
        print("GOT A NEW STREAM");
        print("GOT A NEW STREAM");
        print("GOT A NEW STREAM");
        print("GOT A NEW STREAM");
        print("GOT A NEW STREAM");
        print("GOT A NEW STREAM");
        setState(() {
          this.current_station = station;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    registerStream(context);
    var controller =
        Provider.of<MainController>(context, listen: false).radioController;

    return SizedBox(
      height: 100.0,
      child: GestureDetector(
        onTap: () => controller.playOrPause(),
        child: Container(
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              CircleAvatar(
                child: current_station != null
                    ? Image.network(current_station.imageURL)
                    : Icon(Icons.music_note),
              ),
              SizedBox(width: 50.0),
              Icon(
                Icons.play_circle_filled,
                color: Colors.grey,
                size: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
