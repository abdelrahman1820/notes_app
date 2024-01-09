import 'package:flutter/material.dart';
import 'package:notesapp/views/notes_page.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
      home:  NotesPage(),
    );
  }
}
