import 'package:flutter/material.dart';

final TextEditingController titleController = TextEditingController();
final TextEditingController noteController = TextEditingController();

final FocusNode focusNodee = FocusNode();
late FocusScopeNode currentNode;
bool isEmptytitle = true;
bool isEmptyprice = true;
final FocusNode titleFocusNode = FocusNode();
final FocusNode notestFocusNode = FocusNode();
String kNotesBox = "notes_box";
