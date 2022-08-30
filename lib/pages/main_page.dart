import 'package:flutter/material.dart';
import 'package:flutternotes/pages/main_note.dart';

import '../models/Note.dart';

class MainPage extends StatefulWidget {
  final List<Note> notes;

  MainPage(this.notes, {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Container(
          alignment: Alignment.topLeft,
          child:
              Column(children: widget.notes.map((e) => MainNote(e)).toList())),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressedAdd,
        tooltip: "Add note",
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onPressedAdd() {}
}
