import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NotesState {}

class AddNoteInitial extends NotesState {}

class AddNoteLoading extends NotesState {}

class AddNoteSuccess extends NotesState {}

class AddnoteFailur extends NotesState {
  final String errMessgae;
  AddnoteFailur({required this.errMessgae});
}
