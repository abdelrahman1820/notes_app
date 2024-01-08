import 'dart:math';

import 'package:flutter/material.dart';

class CustomNotesCard extends StatelessWidget {
  CustomNotesCard();

  Color getRandomColor() {
  Random random = Random();

  int red = random.nextInt(128) + 128;
  int green = random.nextInt(128) + 128;
  int blue = random.nextInt(128) + 128;


  return Color.fromARGB(255, red, green, blue).withOpacity(1.0);
}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          color: getRandomColor(), borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flutter Tips",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                  width: 2,
                ),
                Text(
                  "Build your career with\n tharwt samio",
                  style: TextStyle(
                      fontSize: 18,
                      height: 1,
                      color: Colors.black.withOpacity(.8),
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    print("object");
                  },
                ),
                const SizedBox(
                  width: 2,
                  height: 50,
                ),
                const Text(
                  "May21.2022",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


