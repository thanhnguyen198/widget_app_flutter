import 'package:flutter/material.dart';
import '../../colors/hexColor.dart';
import 'tagNew.dart';
import 'typeNewText.dart';

class NewItem extends StatelessWidget {
  final String? typeNew;
  final String? title;
  final String? date;
  final bool? isNew;
  final VoidCallback? onTap;

  const NewItem({
    super.key,
    this.typeNew,
    this.title,
    this.date,
    this.isNew,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: HexColor.gray100,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TypeNewText(text: typeNew),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(title ?? "",
                  style: TextStyle(
                      color: HexColor.gray40,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(date ?? "",
                        style: TextStyle(
                            color: HexColor.gray60,
                            fontWeight: FontWeight.w600)),
                    if (isNew == true) const TagNew(),
                  ],
                ),
                Icon(Icons.chevron_right_outlined,
                    color: HexColor.gray80, size: 40),
              ],
            )
          ])),
    );
  }
}
