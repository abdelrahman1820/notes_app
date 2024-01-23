import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/cubits/notes_cubit/notes_state.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/custom_app_bar.dart';
import 'package:notesapp/widgets/notes.list_view.dart';

class NotesBody extends StatefulWidget {
  NotesBody({
    required this.isSearched,
    required this.mycontroler,
    super.key,
  });
  bool isSearched;
  final TextEditingController mycontroler;

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllnotes();
    setState(() {});
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          List<NoteModel> notes = state.notes;
          List<NoteModel> searchedListNote = [];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: CustomAppBar(
                  con: widget.mycontroler,
                  isSearch: widget.isSearched,
                  text: 'Notes',
                  onpress: () {
                    setState(
                      () {
                        print("asdasd");
                        widget.isSearched = !widget.isSearched;
                        searchedListNote.clear();
                      },
                    );
                  },
                  onchanged: (value) {
                    print("Search value: $value");
                    value = value.toLowerCase();
                    setState(() {
                        searchedListNote = notes
                        .where((note) =>
                            note.title.toLowerCase().startsWith(value))
                        .toList();
                    });
                  
                    print("Searched List: $searchedListNote");
                    print("===============$notes");
                  },
                ),
              ),
              Expanded(
                child: NotesListView(
                  notes: searchedListNote.isNotEmpty ? searchedListNote : notes,
                ),
              ),
            ],
          );
        } else {
          // Handle the case where the state is not NotesLoaded
          // You might want to show a loading indicator or handle it differently
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
