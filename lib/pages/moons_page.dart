import 'package:flutter/material.dart';
import 'package:planets_app/components/simple_item.dart';
import 'package:planets_app/model/planet.dart';
import 'package:planets_app/services/repository.dart';

class MoonsPage extends StatefulWidget {
  const MoonsPage({super.key, required this.planet});

  final Planet planet;

  @override
  State<MoonsPage> createState() => _MoonsPageState();
}

class _MoonsPageState extends State<MoonsPage> {
  final TextEditingController _moonCtrl = TextEditingController();

  addMoon() {
    if (_moonCtrl.text.isNotEmpty) {
      moonRepository
          .add(
        widget.planet.id.toString(),
        _moonCtrl.text,
      )
          .then((value) {
        setState(() => _moonCtrl.text = '');
      });
    }
  }

  Future<List<dynamic>> getMoons() async {
    return await moonRepository.get(widget.planet.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moons of ${widget.planet.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              controller: _moonCtrl,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Type the moon's name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
              child: FutureBuilder(
                future: getMoons(),
                builder: (context, snapshot) {
                  List<dynamic> moons = snapshot.hasData ? snapshot.data! : [];
                  return ListView.builder(
                    itemCount: moons.length,
                    itemBuilder: (context, i) {
                      return SimpleItem(
                        title: moons[i].toString(),
                        delete: () => moonRepository.remove(
                          widget.planet.id.toString(),
                          moons[i].toString(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
