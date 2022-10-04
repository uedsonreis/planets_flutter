import 'package:flutter/material.dart';
import 'package:planets_app/model/planet.dart';
import 'package:planets_app/services/repository.dart';

class MoonsPage extends StatefulWidget {
  const MoonsPage({super.key, required this.planet});

  final Planet planet;

  @override
  State<MoonsPage> createState() => _MoonsPageState();
}

class _MoonsPageState extends State<MoonsPage> {
  String _nameMoon = '';

  addMoon() {
    // print(getMoons());
    moonRepository.addMoon(widget.planet.id.toString(), _nameMoon);
  }

  List<dynamic> getMoons() {
    return moonRepository.getMoon(widget.planet.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> moons = getMoons();
    return Scaffold(
      appBar: AppBar(
        title: Text("Moons of ${widget.planet.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Type the moon's name",
              ),
              onChanged: (value) => setState(() => _nameMoon = value),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                  ),
                  onPressed: addMoon,
                  child: const Text('Add a new Moon'),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: moons.length,
                itemBuilder: (context, i) {
                  return Text(moons[i].toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
