import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/cubits/notes_cubit/notes_state.dart';
import 'package:notesapp/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllnotes() async {
    emit(NotesLoading());
    try {
      var notebox = Hive.box<NoteModel>(kNotesBox);

      emit(
        NotesSuccess(
          notebox.values.toList(),
        ),
      );
    } catch (e) {
      emit(
        Notesfailure(
          e.toString(),
        ),
      );
    }
  }
}
