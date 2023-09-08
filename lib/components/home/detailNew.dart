import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../models/news/responseNews.dart';
import '../../colors/hexColor.dart';
import 'tagNew.dart';
import 'typeNewText.dart';

class DetailNew extends StatelessWidget {
  final ResponseNews detailNew;

  const DetailNew({super.key, required this.detailNew});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
          color: HexColor.gray100, borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: HexColor.gray80,
                    size: 30,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Wrap(
                runSpacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TypeNewText(text: detailNew.categoryName),
                      Row(
                        children: [
                          Text(detailNew.createdAt ?? "",
                              style: TextStyle(
                                  color: HexColor.gray60,
                                  fontWeight: FontWeight.w600)),
                          if (detailNew.isNew()) const TagNew()
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(detailNew.title ?? "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Divider(
                    color: HexColor.gray40,
                  ),
                  Column(children: [
                    Html(data: detailNew.content, style: {
                      "div": Style(color: Colors.white, fontSize: FontSize(14))
                    }),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
