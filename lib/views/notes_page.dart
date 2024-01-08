import 'dart:math';

import 'package:flutter/material.dart';
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
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 4, right: 4, top: 8),
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Notes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, top: 3, bottom: 3),
                    width: 45,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0XFF3A3A3A),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.search,
                      weight: 100,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
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
