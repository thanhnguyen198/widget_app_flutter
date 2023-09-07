import 'package:flutter/material.dart';
import '../../colors/hexColor.dart';

class TypeNewText extends StatelessWidget {
  final String? text;
  const TypeNewText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: HexColor.gray40)),
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 3),
      child: Text(text ?? "",
          style: TextStyle(color: HexColor.gray40, fontSize: 14)),
    );
  }
}
