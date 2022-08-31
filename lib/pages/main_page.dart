import 'package:flutter/material.dart';
import 'package:flutternotes/routes/add_note_route.dart';
import 'package:flutternotes/widgets/main_note_widget.dart';

import '../models/Note.dart';
import '../widgets/add_new_note_widget.dart';

class MainPage extends StatefulWidget {
  final List<Note> notes;

  const MainPage(this.notes, {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var list = widget.notes
        .map((note) => _getNoteViewByNote(note))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Container(
          alignment: Alignment.topLeft,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.notes.length,
              itemBuilder: (context, index) {
                return _getNoteViewByIndex(index);
              },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onPressedAdd(context),
        tooltip: "Add note",
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getNoteViewByIndex(int index) {
    return MainNote(
      onCompleteStatusChange: _onCompleteStatusChange,
      onClick: _onNoteClick,
      note: widget.notes[index],
    );
  }

  Widget _getNoteViewByNote(Note note) {
    return MainNote(
      onCompleteStatusChange: _onCompleteStatusChange,
      onClick: _onNoteClick,
      note: note,
    );
  }

  void _onPressedAdd(BuildContext context) {
    Navigator.of(context).push(AddNoteRoute(
        widgetBuilder: (context) =>
            AddNewNote(onPressed: (note) => _addNote(note, context)),
        isFullscreenDialog: false));
    print("add");
  }

  void _onCompleteStatusChange(bool b, Note note) {
    setState(() {
      note.completeStatus = b;
    });
  }

  void _onNoteClick(Note note) {
    print(note.title);
  }

  void _addNote(Note note, BuildContext context) {
    Navigator.pop(context);
    setState(() {
      widget.notes.add(note);
    });
  }
}
