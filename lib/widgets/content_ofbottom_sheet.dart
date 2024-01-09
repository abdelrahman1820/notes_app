import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_add_botton.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class ContentOfBootomSheet extends StatefulWidget {
  const ContentOfBootomSheet({super.key});

  @override
  State<ContentOfBootomSheet> createState() => _ContentOfBootomSheetState();
}

final TextEditingController titleController = TextEditingController();
final TextEditingController noteController = TextEditingController();

final FocusNode focusNodee = FocusNode();
late FocusScopeNode currentNode;
bool isEmptytitle = true;
bool isEmptyprice = true;
final FocusNode titleFocusNode = FocusNode();
final FocusNode notestFocusNode = FocusNode();

bool isloading = false;

class _ContentOfBootomSheetState extends State<ContentOfBootomSheet> {
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
                    const SizedBox(height: 45,),
                CustomAddButtomButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

