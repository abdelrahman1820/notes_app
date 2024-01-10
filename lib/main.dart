import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/notes_page.dart';

void main() async {
  await Hive.initFlutter(); //بنشأ Hive
  await Hive.openBox(kNotesBox); //بفتح بوكس عشان اخزن فيه
  Hive.registerAdapter(
      NoteModelAdapter()); //بعمل ريجيستر علي الفايل الي اتعمله اوتو كرييت
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => Addnotecubit())],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
        home: NotesPage(),
      ),
    );
  }
}
