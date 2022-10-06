import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class MoonRepository {
  final LocalStorage _storage = LocalStorage('moons.json');

  Future<void> add(String planetId, String moonName) async {
    List<dynamic> moons = await get(planetId);
    moons.add(moonName);
    await _storage.setItem(planetId, jsonEncode(moons));
  }

  Future<List<dynamic>> get(String planetId) async {
    bool isReady = await _storage.ready;
    if (isReady) {
      dynamic json = _storage.getItem(planetId);
      if (json != null) return jsonDecode(json);
    }
    return [];
  }

  Future<void> remove(String planetId, String moonName) async {
    List<dynamic> moons = await get(planetId);
    moons.removeWhere((element) => element == moonName);
    await _storage.setItem(planetId, jsonEncode(moons));
  }
}

final MoonRepository moonRepository = MoonRepository();
