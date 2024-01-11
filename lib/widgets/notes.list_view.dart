import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/cubits/notes_cubit/notes_state.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/custom_notes_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 12, right: 12, bottom: 8),
          child: notes.isEmpty
              ? const Center(
                  child: Text(
                  "there is no notes",
                  style: TextStyle(fontSize: 30),
                ))
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount:
                      notes.length, // Specify the number of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    return CustomNotesCard(); // Use the custom card widget directly
                  },
                ),
        );
      },
    );
  }
}
