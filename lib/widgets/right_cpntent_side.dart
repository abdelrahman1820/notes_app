import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';

class RightContentSide extends StatelessWidget {
  const RightContentSide({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllnotes();
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.date_range,
                color: Colors.black,
              ),
              Text(
                note.date,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
