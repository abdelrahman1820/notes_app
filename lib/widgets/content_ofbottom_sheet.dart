import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/const.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_state.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';

import 'package:notesapp/widgets/custom_add_botton.dart';
import 'package:notesapp/widgets/custom_text_field.dart';

class ContentOfBootomSheet extends StatefulWidget {
  const ContentOfBootomSheet({super.key});

  @override
  State<ContentOfBootomSheet> createState() => _ContentOfBootomSheetState();
}

class _ContentOfBootomSheetState extends State<ContentOfBootomSheet> {
  @override
  void dispose() {
    _clearFields();

    super.dispose();
  }

  void _clearFields() {
    titleController.clear();
    noteController.clear();
    isEmptyprice = true;
    isEmptytitle = true;
  }

  DateTime date = DateTime.now();
  String formattedDate() {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Addnotecubit(),
      child: GestureDetector(
        onTap: () {
          currentNode = FocusScope.of(context);
          if (currentNode.focusedChild != null &&
              !currentNode.hasPrimaryFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
            //textController.clear();
          }
        },
        child: BlocConsumer<Addnotecubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddnoteFailur) {
              print("faild${state.errMessgae}");
            }
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllnotes();

              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SizedBox(
              height: 400,
              child: ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
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
                      padding: EdgeInsets.only(
                        top: 40,
                      ),
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
                            input: TextInputType.text,
                          ),
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
                            input: TextInputType.text,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 40.0,
                            ),
                            child: CustomAddButtomButton(
                              ontap: () {
                                if (titleController.text.isEmpty ||
                                    noteController.text.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.red,
                                        title: const Text('Error'),
                                        content: const Row(
                                          children: [
                                            Icon(Icons.error,
                                                color: Colors.black),
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
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Center(
                                                child: Text('OK'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  var notemodel = NoteModel(
                                      title: titleController.text,
                                      subtitle: noteController.text,
                                      date: formattedDate(),
                                      color: Colors.amber.value);
                                  BlocProvider.of<Addnotecubit>(context)
                                      .addnote(notemodel);
                                  print(
                                      "titles is ${titleController.text} and sub title is ${noteController.text} form textcontroler");
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
