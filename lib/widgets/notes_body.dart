import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/widgets/custom_app_bar.dart';
import 'package:notesapp/widgets/notes.list_view.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NotesCubit(),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: CustomAppBar(
              text: 'Notes',
              icon: Icons.search,
            ),
          ),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
