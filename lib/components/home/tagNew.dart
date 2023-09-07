import 'package:flutter/material.dart';
import 'package:widget_app/colors/hexColor.dart';

class TagNew extends StatelessWidget {
  const TagNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
          color: HexColor.redNav,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: const Text(
        "NEW",
        style: TextStyle(
            fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
