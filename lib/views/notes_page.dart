import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notesapp/widgets/contentofbottomsheet.dart';
import 'package:notesapp/widgets/custom_app_bar.dart';
import 'package:notesapp/widgets/custom_notes_card.dart';
import 'package:notesapp/widgets/custom_text_field.dart';
import 'package:notesapp/widgets/notes.list_view.dart';
import 'package:notesapp/widgets/notes_body.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}



class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ContentOfBootomSheet();
              },
            );
          },
          child: Icon(Icons.add),
        ),
        body: NotesBody());
  }
}

