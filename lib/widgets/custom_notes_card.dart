import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/edit_notes.dart';

class CustomNotesCard extends StatelessWidget {
  CustomNotesCard({required this.note});

  Color getRandomColor() {
    Random random = Random();

    int red = random.nextInt(128) + 128;
    int green = random.nextInt(128) + 128;
    int blue = random.nextInt(128) + 128;

    return Color.fromARGB(255, red, green, blue).withOpacity(1.0);
  }

  // DateTime date = DateTime.now();
  // String formattedDate() {
  //   return DateFormat('yyyy-MM-dd').format(date);
  // }

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(note: note,);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Text(
                      note.subtitle,
                      style: TextStyle(
                          fontSize: 20,
                          height: 1,
                          color: Colors.black.withOpacity(.8),
                          fontStyle: FontStyle.normal),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 45,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
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
                  const SizedBox(
                    width: 2,
                    height: 70,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.date_range,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        note.date,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
