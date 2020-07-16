import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:radiohead/models/station.dart';

class RadioController {
  var state = FlutterRadioPlayer.flutter_radio_stopped;
  List<Function> _listeners;
  Station _currentStation;
  double volume;
  FlutterRadioPlayer _player;
  StreamController<Station> _stream_controller;
  RadioController() {
    _player = FlutterRadioPlayer();
    volume = 0.5;
    _listeners = List<Function>();

    _stream_controller = StreamController<Station>.broadcast();
  }

  Stream get getStationStream => _stream_controller.stream;

  playOrPause() async {
    try {
      await _player.playOrPause();
    } catch (e) {}
  }

  stop() async {
    try {
      await _player.stop();
    } catch (e) {}
  }

  void registerListener(Function func) {
    print("registered listener");
    _listeners.add(func);
  }

  void notifyListeners() {
    for (Function listener in _listeners) {
      listener(_currentStation);
    }
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
