import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_notes_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12, bottom: 8),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 12, // Specify the number of items in the list
        itemBuilder: (BuildContext context, int index) {
          return CustomNotesCard(); // Use the custom card widget directly
        },
      ),
    );
  }
}
