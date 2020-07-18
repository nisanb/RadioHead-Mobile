import 'package:flutter/material.dart';
import 'package:radiohead/widgets/bottom_action_row.dart';
import 'package:radiohead/widgets/volume_slider.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(100.0), topLeft: Radius.circular(100.0)),
      child: Container(
          color: Colors.black87,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              BottomActionRow(),
              VolumeSlider(),
            ],
          )),
    );
  }
}
