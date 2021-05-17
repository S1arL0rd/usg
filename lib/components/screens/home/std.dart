import 'package:flutter/material.dart';

class Std extends StatefulWidget {
  @override
  _StdState createState() => _StdState();
}

class _StdState extends State<Std> {
  @override
  Widget build(BuildContext context) {
    var name = ' احمد محمد';
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
    );
  }
}
