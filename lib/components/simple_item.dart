import 'package:flutter/material.dart';

class SimpleItem extends StatelessWidget {
  const SimpleItem({
    Key? key,
    required this.title,
    this.subTitle,
    this.onPress,
    this.delete,
  }) : super(key: key);

  final String title;
  final String? subTitle;
  final Function? onPress;
  final Function? delete;

  @override
  Widget build(BuildContext context) {
    if (delete == null) {
      return buildItem(context);
    } else {
      return Dismissible(
        key: ValueKey(title),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('delete'),
        ),
        onDismissed: (direction) {
          delete!();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Item was deleted!')),
          );
        },
        child: buildItem(context),
      );
    }
  }

  Widget buildItem(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 18)),
      subtitle: subTitle == null
          ? null
          : Text(
              subTitle!,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
      onTap: () {
        if (onPress != null) onPress!();
      },
    );
  }
}
