import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_state.dart';
import 'package:notesapp/models/note_model.dart';

class Addnotecubit extends Cubit<NotesState> {
  Addnotecubit() : super(AddNoteInitial());
  addnote(NoteModel note) {



  }
}
