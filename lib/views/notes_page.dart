import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_app_bar.dart';
import 'package:notesapp/widgets/custom_notes_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomNotesCard(),
                      CustomNotesCard(),
                      CustomNotesCard(),
                      CustomNotesCard(),
                      CustomNotesCard(),
                      CustomNotesCard(),
                      CustomNotesCard(),
                      CustomNotesCard(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


