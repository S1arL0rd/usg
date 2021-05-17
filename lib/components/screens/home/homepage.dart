import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'cards/Notes.dart';
import 'cards/asg.dart';
import 'cards/lec.dart';
import 'cards/study.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = ' احمد محمد';
  final List<String> titles = ["محاضرات", 'تسليمات', 'مذاكرة', 'ملاحظات'];
  final List<Widget> routs = [
    Lec(),
    Asg(),
    Study(),
    Notes(),
  ];
  final List<Widget> images = [
    Hero(
      tag: "محاضرات",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          "assets/images/dom-fou-YRMWVcdyhmI-unsplash.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ),
    Hero(
      tag: "تسليمات",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          "assets/images/daria-nepriakhina-zoCDWPuiRuA-unsplash.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ),
    Hero(
      tag: "مذاكرة",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          "assets/images/arisa-chattasa-0LaBRkmH4fM-unsplash.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ),
    Hero(
      tag: "ملاحظات",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          "assets/images/absolutvision-82TpEld0_e4-unsplash.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مرحبا $name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(
                    'نتمني لك يوماً سعيداً 😊',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  // textStyle: TextStyle(color : Colors.red),
                  titles: titles,
                  images: images,
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  onPageChanged: (page) {
                    // print(page);
                  },
                  onSelectedItem: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => routs[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
