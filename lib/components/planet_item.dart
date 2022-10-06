import 'package:flutter/material.dart';
import 'package:planets_app/components/simple_item.dart';
import 'package:planets_app/model/planet.dart';
import 'package:planets_app/pages/planet_detail_page.dart';

class PlanetItem extends StatelessWidget {
  const PlanetItem({Key? key, required this.planet}) : super(key: key);

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return SimpleItem(
      title: planet.name,
      subTitle: "${planet.id}° planet",
      onPress: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlanetDetailPage(planet: planet),
        ),
      ),
    );
  }
}
