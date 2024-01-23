import 'package:notesapp/models/note_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {
  List<NoteModel> notes;
  NotesSuccess({required this.notes});
}
