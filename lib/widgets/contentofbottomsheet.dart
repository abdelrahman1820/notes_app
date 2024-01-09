import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class ContentOfBootomSheet extends StatefulWidget {
  const ContentOfBootomSheet({super.key});

  @override
  State<ContentOfBootomSheet> createState() => _ContentOfBootomSheetState();
}
final TextEditingController titleController = TextEditingController();
final TextEditingController noteController = TextEditingController();

final FocusNode focusNode = FocusNode();
// late FocusScopeNode currentNode;
bool isEmptytitle = true;
bool isEmptyprice = true;

final FocusNode titleFocusNode = FocusNode();
final FocusNode notestFocusNode = FocusNode();

bool isloading = false;

class _ContentOfBootomSheetState extends State<ContentOfBootomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      height: 500,
      child: Center(
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
                isEmpty: isEmptyprice,
                myicon: Icons.title,
                myhint: "enter title",
                mylabel: "title",
                input: TextInputType.name),
            EditInPutText(
                onChanged: (value) {
                  setState(() {
                    isEmptyprice = value.isEmpty;
                  });
                },
                textController: noteController,
                focusNodee: notestFocusNode,
                isEmpty: isEmptytitle,
                myicon: Icons.note_alt_rounded,
                myhint: "enter notes",
                mylabel: "notes",
                input: TextInputType.name)
          ],
        ),
      ),
    );
  }
}
