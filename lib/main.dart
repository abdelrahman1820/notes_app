import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/views/notes_page.dart';
import 'package:notesapp/widgets/const.dart';

void main() async {
  await Hive.initFlutter();
 await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
      home: NotesPage(),
    );
  }
}
