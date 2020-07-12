import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/models/station.dart';

class StationWidget extends StatelessWidget {
  final Station station;

  StationWidget({@required this.station});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Want to listen to station ${station.codeURL}");
        Provider.of<MainController>(context, listen: false)
            .radioController
            .initRadioService(station);
      },
      child: Column(
        children: <Widget>[
          Image.network(station.imageURL),
        ],
      ),
    );
  }
}
