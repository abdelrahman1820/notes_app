import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 8),
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, top: 3, bottom: 3),
            width: 45,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0XFF3A3A3A),
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              icon: Icon(
                icon,
                size: 30,
              ),
              onPressed: () {
                print("searchclicked");
              },
            ),
          )
        ],
      ),
    );
  }
}
