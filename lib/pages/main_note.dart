import 'package:flutter/material.dart';
import 'package:flutternotes/models/Note.dart';

class MainNote extends StatelessWidget {
  Note _note;

  MainNote(this._note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Text(_note.title)
          ],
        ),
      ),
    );
  }
}
