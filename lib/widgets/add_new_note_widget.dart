import 'package:flutter/material.dart';

import '../models/Note.dart';

class AddNewNote extends StatelessWidget {
  final Function(Note note) onPressed;
  String _title = "";
  String _description = "";

  AddNewNote({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 72.0), child: _card()));
  }

  Widget _card() => Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: TextField(
                  maxLines: 1,
                  onChanged: (value) => _title = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
              ),
              TextField(
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                onChanged: (value) => _description = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              ElevatedButton(onPressed: () => onPressed(Note(_title, _description)), child: const Text("Save"))
            ],
          ),
        ),
      );
}
