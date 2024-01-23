
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddnoteFailur extends AddNoteState {
  final String errMessgae;
  AddnoteFailur({required this.errMessgae});
}
