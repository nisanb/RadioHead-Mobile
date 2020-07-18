import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:radiohead/models/station.dart';

class RadioController {
  var state = FlutterRadioPlayer.flutter_radio_stopped;
  double volume;
  FlutterRadioPlayer _player;
  StreamController<Station> _stream_controller;
  RadioController() {
    _player = FlutterRadioPlayer();
    volume = 0.5;

    _stream_controller = StreamController<Station>.broadcast();
  }

  Stream get getStationStream => _stream_controller.stream;
  Stream get getStateStream => _player.isPlayingStream;

  playOrPause() async {
    try {
      await _player.playOrPause();
    } catch (e) {}
  }

  changeVolume(double volume) async {
    try {
      await _player.setVolume(volume);
    } catch (e) {}
  }

  stop() async {
    try {
      await _player.stop();
    } catch (e) {}
  }

  Future<void> playStation(Station station) async {
    if (_player == null) {
      print("Player is NULL!");
      return;
    }
    try {
      await _player.stop();
    } catch (e) {}

    try {
      _stream_controller.add(station);
      await _player.init(
          "RadioHead Live - רדיו הד",
          "Playing ${station.nameEnglish} - מאזין ל- ${station.nameHebrew}",
          station.codeURL,
          "true");
    } on PlatformException {
      print("Exception occured while trying to register the services.");
    }
  }
}
