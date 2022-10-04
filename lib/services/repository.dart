import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class MoonRepository {
  final LocalStorage _storage = LocalStorage('moons.json');

  Future<void> addMoon(String planetId, String moonName) async {
    List<dynamic> moons = getMoon(planetId);
    moons.add(moonName);
    await _storage.setItem(planetId, jsonEncode(moons));
  }

  List<dynamic> getMoon(String planetId) {
    dynamic json = _storage.getItem(planetId);
    if (json == null) {
      return [];
    } else {
      return jsonDecode(json);
    }
  }
}

final MoonRepository moonRepository = MoonRepository();
