import 'package:flutter/material.dart';
import 'package:sitegalleria/const.dart';

class MyTextfeild extends StatelessWidget {
  const MyTextfeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white70,
        decoration: InputDecoration(
            hintText: 'Search Marriage, carrer etc',
            hintStyle: TextStyle(color: Color5),
            fillColor: Color4,
            prefixIcon: Icon(
              Icons.search,
              color: Color5,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent)),
            filled: true),
      ),
    );
  }
}
