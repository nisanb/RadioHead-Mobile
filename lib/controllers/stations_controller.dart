import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:radiohead/models/station.dart';

class StationsController {
  List<Station> _stations;

  Future<List<Station>> getStations({Function callback}) async {
    if (_stations == null || _stations.isEmpty) {
      print("Loading stations..");
      _stations = await loadStations();
      print("Loaded ${_stations.length} stations");
    }

    callback(_stations);
  }

  Future<List<Station>> loadStations() async {
    List<Station> toReturn = [];
    List<dynamic> stations =
        await parseJsonFromAssets("assets/data/stations.json");
    for (var station in stations) {
      // Add a new station object
      toReturn.add(Station(
          nameHebrew: station["nameHE"],
          nameEnglish: station["nameEN"],
          freq: station["freq"],
          codeURL: station["code"],
          imageURL: station["img"]));
    }

    return toReturn;
  }

  Future<List<dynamic>> parseJsonFromAssets(String assetsPath) async {
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
