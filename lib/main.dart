import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/simple_bloc_observer.dart';
import 'package:notesapp/views/notes_page.dart';
import 'package:path_provider/path_provider.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//    final directory = await getApplicationDocumentsDirectory();
//   Hive.init(directory.path);

//   Bloc.observer = SimpleBlocObserver();
//   await Hive.openBox<NoteModel>(kNotesBox);
//   Hive.registerAdapter(NoteModelAdapter());
//   runApp(const NotesApp());
// }
Future main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
      home: NotesPage(),
    );
  }
}
