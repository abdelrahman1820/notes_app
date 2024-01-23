import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';

class LeftContentside extends StatelessWidget {
  const LeftContentside({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: const TextStyle(fontSize: 28, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, right: 15),
            child: SizedBox(
              
              child: Text(
                note.subtitle,
                maxLines: null,
                style: TextStyle(
                    fontSize: 18,
                    height: 1,
                    color: Colors.black.withOpacity(.7),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          )
        ],
      ),
    );
  }
}
