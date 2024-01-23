import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/content_ofbottom_sheet.dart';
import 'package:notesapp/widgets/notes_body.dart';

class NotesPage extends StatelessWidget {
   NotesPage({Key? key}) : super(key: key);

  final _searchTextcontroler = TextEditingController();

  bool isSearched = false;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const SingleChildScrollView(
                    child: ContentOfBootomSheet(),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: NotesBody(
          isSearched: isSearched,
          mycontroler: _searchTextcontroler,
        ));
  }
}
