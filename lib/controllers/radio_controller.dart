import 'package:flutter/services.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:radiohead/models/station.dart';

class RadioController {
  var state = FlutterRadioPlayer.flutter_radio_stopped;
  double volume;
  FlutterRadioPlayer _player;
  RadioController() {
    _player = FlutterRadioPlayer();

    volume = 0.5;
  }

  Future<void> initRadioService(Station station) async {
    try {
      if (await _player.isPlaying()) {
        await _player.stop();
      }
      await _player.init(
          "RadioHead Live - רדיו הד",
          "Playing ${station.nameEnglish} - מאזין ל- ${station.nameHebrew}",
          station.codeURL,
          "true");
    } on PlatformException {
      print("Exception occured while trying to register the services.");
    }
  }

  void changeStation(Station station) {}
}
