import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usg/components/screens/constants.dart';
import 'package:usg/components/screens/home/std.dart';
import 'package:usg/components/screens/home/uni.dart';

import 'homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _childeren = [
    Std(),
    HomePage(),
    Uni(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('هل متأكد انك تريد الخروج ؟'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('لا')),
                FlatButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('نعم')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _childeren[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: uprimary,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.7),
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_outlined),
              title: new Text('الطالب'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home_outlined),
              title: new Text('الصفحة الرئيسية'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined), title: Text('الجامعة'))
          ],
        ),
      ),
    );
  }
}
