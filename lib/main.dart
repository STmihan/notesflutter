import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'models/Note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Note> _notes = [
    Note("Note 1", "Description 1"),
    Note("Note 2", "Description 2"),
    Note("Note 3", "Description 3"),
    Note("Note 4", "Description 4"),
  ];

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage(_notes));
  }
}
