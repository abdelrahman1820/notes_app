import 'package:flutter/material.dart';

class CustomAddButtomButton extends StatelessWidget {
   CustomAddButtomButton({
    required this.ontap,
    super.key,
  });
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8,
      ),
      child: GestureDetector(
        onTap:ontap ,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: const Center(
              child: Text(
            "AddNote",
            style: TextStyle(fontSize: 20),
          )),
        ),
      ),
    );
  }
}
