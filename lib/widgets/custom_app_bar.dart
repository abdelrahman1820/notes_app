import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.text,
    this.onpress,
    this.isSearch = false,
    this.onchanged, 
    this.con
   
  });
  final String text;
  void Function(String)? onchanged;

  final void Function()? onpress;
  final bool isSearch;
 final TextEditingController? con;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 8),
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: isSearch
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: onchanged,
              
                    decoration: const InputDecoration(
                      hintText: 'Search note...',
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
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
                    icon: const Icon(
                      Icons.clear,
                      size: 30,
                    ),
                    onPressed: onpress,
                  ),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
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
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: onpress,
                  ),
                )
              ],
            ),
    );
  }
}
