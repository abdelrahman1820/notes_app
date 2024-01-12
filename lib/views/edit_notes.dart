import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
   EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return EditNoteViewBody(note: note,);
  }
}
