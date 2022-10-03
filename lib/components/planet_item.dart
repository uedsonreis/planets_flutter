import 'package:flutter/material.dart';
import 'package:planets_app/model/planet.dart';

class PlanetItem extends StatelessWidget {
  const PlanetItem({Key? key, required this.planet}) : super(key: key);

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        planet.name,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        "${planet.id}° planet",
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}
