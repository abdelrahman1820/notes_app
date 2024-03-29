import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/cubits/notes_cubit/notes_state.dart';
import 'package:notesapp/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllnotes()  {
    var notebox = Hive.box<NoteModel>(kNotesBox);
    notes = notebox.values.toList();
    emit(NotesSuccess(notes: notes!));
  }
}
