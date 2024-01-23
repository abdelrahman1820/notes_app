import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';

import 'package:notesapp/widgets/custom_app_bar.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  void dispose() {
    // TODO: implement dispose

    titleController.clear();
    noteController.clear();
    isEmptyprice = true;
    isEmptytitle = true;
    super.dispose();
  }

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentNode = FocusScope.of(context);
        if (currentNode.focusedChild != null && !currentNode.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
          //textController.clear();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: CustomAppBar(
                  text: "Editnotes",
                  
                  onpress: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.subtitle = content ?? widget.note.subtitle;
                    widget.note.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllnotes();

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.blue),
                            SizedBox(width: 8),
                            Text("Notes Edit"),
                          ],
                        ),
                        backgroundColor:
                            Colors.green, // Customize the background color
                        duration: Duration(
                            seconds: 3), // Adjust the duration as needed
                      ),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              EditInPutText(
                  onChanged: (value) {
                    title = value;
                    setState(() {
                      isEmptytitle = value.isEmpty;
                    });
                  },
                  textController: titleController,
                  focusNodee: titleFocusNode,
                  isEmpty: isEmptytitle,
                  myicon: Icons.title,
                  myhint: widget.note.title,
                  mylabel: "title",
                  input: TextInputType.text),
              const SizedBox(
                height: 10,
              ),
              EditInPutText(
                  libe: 4,
                  onChanged: (value) {
                    content = value;
                    setState(() {
                      isEmptyprice = value.isEmpty;
                    });
                  },
                  textController: noteController,
                  focusNodee: notestFocusNode,
                  isEmpty: isEmptyprice,
                  myicon: Icons.note_alt_rounded,
                  myhint: widget.note.subtitle,
                  mylabel: "notes",
                  input: TextInputType.text),
              const SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
