import 'package:radiohead/controllers/firebase_controller.dart';
import 'package:radiohead/controllers/radio_controller.dart';
import 'package:radiohead/controllers/stations_controller.dart';

class MainController {
  FireBaseController _firebase_controller;
  RadioController _radioController;
  StationsController _stationsController;

  MainController() {
    _firebase_controller = FireBaseController();
    _stationsController = StationsController();
    _radioController = RadioController();
  }

  FireBaseController get fireBaseController => _firebase_controller;
  RadioController get radioController => _radioController;
  StationsController get stationsController => _stationsController;
}
