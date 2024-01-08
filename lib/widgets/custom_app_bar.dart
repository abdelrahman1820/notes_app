import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

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
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Notes",
              style: TextStyle(
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
            child: const Icon(
              Icons.search,
              weight: 100,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}