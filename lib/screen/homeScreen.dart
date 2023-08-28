import 'package:flutter/material.dart';
import 'package:widget_app/colors/hexColor.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "What's New",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: HexColor.redNav,
        ),
        backgroundColor: HexColor.bgDark,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/homeImage.png",
              fit: BoxFit.fitWidth,
            ),
            Expanded(
                child: SizedBox(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: <Widget>[
                  NewItem(
                    typeNew: "新機能",
                    date: "2022/04/01",
                    content: "お知らせ タイトルお知らせ タイトルお知らせ タイトルお知らせ タイトルお知らせ タ",
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return const DetailNew();
                        },
                      );
                    },
                  ),
                  const NewItem(
                    typeNew: "新機能",
                    date: "2022/04/01",
                    content: "お知らせ タイトルお知らせ タイトルお知らせ タイトルお知らせ タイトルお知らせ タ",
                  ),
                  const NewItem(
                    typeNew: "新機能",
                    date: "2022/04/01",
                    content: "お知らせ タイトルお知らせ タイトルお知らせ タイトルお知らせ タイトルお知らせ タ",
                  )
                ],
              ),
            ))
          ],
        ));
  }
}

class DetailNew extends StatelessWidget {
  const DetailNew({
    super.key,
  });

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
                      const TypeNewText(text: "新機能"),
                      Row(
                        children: [
                          Text("2022/04/01",
                              style: TextStyle(
                                  color: HexColor.gray60,
                                  fontWeight: FontWeight.w600)),
                          const TagNew()
                        ],
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("お知らせ タイトル",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Divider(
                    color: HexColor.gray40,
                  ),
                  Column(children: [
                    Image.asset("assets/homeImage.png"),
                    const Text(
                        style: TextStyle(color: Colors.white),
                        "情に棹させば流される。智に働けば角が立つ。どこへ越しても住みにくいと悟った時、詩が生れて、画が出来る。とかくに人の世は住みにくい。意地を通せば窮 どこへ越しても住みにくいと悟った時、詩が生れて、画が出来る。意地を通せば窮屈だ。山路を登りながら、こう考えた。智に働けば角が立つ。どこへ越しても住みにくいと悟った時、詩が生れて、画が出来る。情に棹させば流される。智に働けば角が立つ。どこへ越しても住みにくいと悟った時、詩が生れて、画が出来る。とかくに人の世は住みにくい。意地を通せば窮屈だ。 とかくに人の世は住みにくい。どこへ越しても住みにくいと悟った時、詩が生れて、画が出来る。意地を通せば窮屈だ。山路を登りながら、こう考えた。智に働けば角が立つ。どこへ越しても住みにくいと悟った時、詩が生れて、画が出来る。")
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

class NewItem extends StatelessWidget {
  final String? typeNew;
  final String? content;
  final String? date;
  final VoidCallback? onTap;
  const NewItem({super.key, this.typeNew, this.content, this.date, this.onTap});
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
              child: Text(content ?? "",
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
                    const TagNew(),
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
