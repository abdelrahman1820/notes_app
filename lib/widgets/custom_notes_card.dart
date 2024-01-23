import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/edit_notes.dart';
import 'package:notesapp/widgets/left_content_side.dart';
import 'package:notesapp/widgets/right_cpntent_side.dart';

class CustomNotesCard extends StatelessWidget {
  const CustomNotesCard({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(
                note: note,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 2, child: LeftContentside(note: note)),
              Expanded(flex: 1, child: RightContentSide(note: note)),
            ],
          ),
        ),
      ),
    );
  }
}
