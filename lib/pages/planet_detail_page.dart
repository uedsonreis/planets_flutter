import 'package:flutter/material.dart';
import 'package:planets_app/model/planet.dart';
import 'package:planets_app/pages/moons_page.dart';

class PlanetDetailPage extends StatelessWidget {
  const PlanetDetailPage({Key? key, required this.planet}) : super(key: key);

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
        actions: <Widget>[
          TextButton(
            child: const Text('Moons'),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoonsPage(planet: planet),
                )),
          ),
        ],
      ),
      body: _buildPlanetDetail(),
    );
  }

  Widget _buildPlanetDetail() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            planet.imageUrl,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              planet.description,
              textAlign: TextAlign.justify,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Mass: ${planet.mass}",
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Volume: ${planet.volume}",
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
