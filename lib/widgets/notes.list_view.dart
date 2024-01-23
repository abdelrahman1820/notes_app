import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/cubits/notes_cubit/notes_state.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/custom_notes_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    required this.notes,
    super.key,
  });
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12, bottom: 8),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomNotesCard(note: notes[index]);
        },
      ),
    );
  }
}
