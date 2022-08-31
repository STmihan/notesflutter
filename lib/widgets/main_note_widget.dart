import 'package:flutter/material.dart';
import 'package:flutternotes/models/Note.dart';

class MainNote extends StatelessWidget {
  final Note note;
  final Function(bool, Note) onCompleteStatusChange;
  final Function(Note note) onClick;

  const MainNote(
      {Key? key,
      required this.note,
      required this.onCompleteStatusChange,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(note.title),
                  Checkbox(
                      value: note.completeStatus,
                      onChanged: (b) {
                        onCompleteStatusChange(b!, note);
                      }),
                ],
              )),
        ),
        onTap: () => onClick(note),
      ),
    );
  }
}
