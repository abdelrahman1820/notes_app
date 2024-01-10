import 'package:flutter/material.dart';
import 'package:notesapp/widgets/const.dart';
import 'package:notesapp/widgets/content_ofbottom_sheet.dart';
import 'package:notesapp/widgets/custom_add_botton.dart';
import 'package:notesapp/widgets/custom_app_bar.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key});

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
                child: CustomAppBar(text: "Editnotes", icon: Icons.done),
              ),
              EditInPutText(
                  onChanged: (value) {
                    setState(() {
                      isEmptytitle = value.isEmpty;
                    });
                  },
                  textController: titleController,
                  focusNodee: titleFocusNode,
                  isEmpty: isEmptytitle,
                  myicon: Icons.title,
                  myhint: "enter title",
                  mylabel: "title",
                  input: TextInputType.text),
              const SizedBox(
                height: 10,
              ),
              EditInPutText(
                  libe: 4,
                  onChanged: (value) {
                    setState(() {
                      isEmptyprice = value.isEmpty;
                    });
                  },
                  textController: noteController,
                  focusNodee: notestFocusNode,
                  isEmpty: isEmptyprice,
                  myicon: Icons.note_alt_rounded,
                  myhint: "enter notes",
                  mylabel: "notes",
                  input: TextInputType.text),
              const SizedBox(
                height: 45,
              ),
              const CustomAddButtomButton()
            ],
          ),
        ),
      ),
    );
  }
}
