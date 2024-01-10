import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_state.dart';
import 'package:notesapp/models/note_model.dart';

class Addnotecubit extends Cubit<NotesState> {
  Addnotecubit() : super(AddNoteInitial());
  addnote(NoteModel note) async {
    emit(AddNoteLoading());

    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(
        AddnoteFailur(
          errMessgae: e.toString(),
        ),
      );
      // TODO
    }
  }
}
