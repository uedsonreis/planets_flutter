import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:planets_app/model/planet.dart';

class PlanetService {
  PlanetService();

  final String _url =
      "https://planets-info-by-newbapi.p.rapidapi.com/api/v1/planet/list";

  Future<List<Planet>> getPlanets() async {
    final response = await http.get(
      Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-RapidAPI-Key': 'bf7ec961e0msh2bfe61ab9094691p1bd748jsn791a6b315347',
        'X-RapidAPI-Host': 'planets-info-by-newbapi.p.rapidapi.com'
      },
    );

    List<dynamic> list = List.from(jsonDecode(response.body));
    List<Planet> planets = list.map((e) => Planet.fromJson(e)).toList();

    planets.sort((a, b) => a.id.compareTo(b.id));
    return planets;
  }
}
