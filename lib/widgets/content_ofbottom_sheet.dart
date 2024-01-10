import 'package:flutter/material.dart';
import 'package:notesapp/const.dart';

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

  String? title, subtitle;

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
                    title = value;
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
                  input: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                EditInPutText(
                  libe: 4,
                  onChanged: (value) {
                    subtitle = value;
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
                  input: TextInputType.text,
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomAddButtomButton(
                  ontap: () {
                    if (title == null ||
                        title!.isEmpty ||
                        subtitle == null ||
                        subtitle!.isEmpty) {
                      showErrorDialog(context);
                    } else {
                      print("titles is $title and sub title is $subtitle");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showErrorDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.red,
        title: const Text('Error'),
        content: const Row(
          children: [
            Icon(Icons.error, color: Colors.black),
            SizedBox(
              width: 4,
            ),
            Text("Please Enter All feilds"),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text('OK'),
              ),
            ),
          ),
        ],
      );
    },
  );
}
