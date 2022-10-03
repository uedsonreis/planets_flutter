import 'package:flutter/material.dart';
import 'package:planets_app/components/planet_item.dart';
import 'package:planets_app/model/planet.dart';
import 'package:planets_app/services/planet_service.dart';

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({super.key});

  final String title = "Solar System's Planet";

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  Future<List<Planet>> fetchPlanets() async {
    PlanetService service = PlanetService();
    return await service.getPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPlanets(),
      builder: (context, AsyncSnapshot<List<Planet>> snapshot) {
        List<Planet> planets = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: buildPlanetList(planets),
        );
      },
    );
  }

  Widget buildPlanetList(List<Planet> planets) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: planets.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            PlanetItem(planet: planets[i]),
            const Divider(),
          ],
        );
      },
    );
  }
}
