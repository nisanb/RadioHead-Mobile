import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/controllers/radio_controller.dart';

class VolumeSlider extends StatefulWidget {
  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double volume;
  RadioController controller;

  @override
  void initState() {
    super.initState();
    this.volume = 0.5;
    controller =
        Provider.of<MainController>(context, listen: false).radioController;
  }

  updateVolume(double val) {
    setState(() {
      volume = val;
      controller.changeVolume(volume);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: volume,
      min: 0,
      max: 1,
      divisions: 100,
      onChanged: (val) {
        updateVolume(val);
      },
    );
  }
}
