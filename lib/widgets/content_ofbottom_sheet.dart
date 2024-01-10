import 'package:flutter/material.dart';
import 'package:notesapp/widgets/const.dart';
import 'package:notesapp/widgets/custom_add_botton.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class ContentOfBootomSheet extends StatefulWidget {
  const ContentOfBootomSheet({super.key});

  @override
  State<ContentOfBootomSheet> createState() => _ContentOfBootomSheetState();
}

class _ContentOfBootomSheetState extends State<ContentOfBootomSheet> {
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
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        width: double.infinity,
        height: 600,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
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
      ),
    );
  }
}
