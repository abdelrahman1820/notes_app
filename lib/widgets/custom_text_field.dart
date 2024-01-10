import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditInPutText extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNodee;
  bool isEmpty;
  IconData myicon;
  String myhint;
  String mylabel;
  Function(String)? onChanged;
  TextInputType input;
  int? libe;

  EditInPutText(
      {required this.textController,
      required this.focusNodee,
      required this.isEmpty,
      required this.myicon,
      required this.myhint,
      required this.mylabel,
      required this.input,
      required this.onChanged,
      this.libe = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
      child: TextField(
        keyboardType: input,
        maxLines: libe,
        controller: textController,
        focusNode: focusNodee,
        onChanged: onChanged,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(myicon),
          prefixIconConstraints: const BoxConstraints(
              minWidth: 40, minHeight: 40), // Added icon size constraints
          prefixIconColor: Colors.black,
          hintText: myhint,
          hintStyle: TextStyle(color: Colors.grey),
          labelText: mylabel,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: isEmpty ? Colors.red : Colors.green, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: isEmpty ? Colors.blue : Colors.green, width: 2),
          ),
        ),
      ),
    );
  }
}
