import 'package:flutter/material.dart';

class Uni extends StatefulWidget {
  @override
  _UniState createState() => _UniState();
}

class _UniState extends State<Uni> {
  var name = ' احمد محمد';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
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
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: Column(
              children: [
                Theme(
                  data: theme,
                  child: ExpansionTile(
                    title: Text('مسابقة احسن تطبيق'),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'أ./ مها محمد - مدير إدارة النشاط العلمي بالجامعة – (01273958561) / - أ./ محمد عزت – (01220575496)',
                        ),
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: theme,
                  child: ExpansionTile(
                    title: Text('مسابقة رسم وغناء'),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'أ./ مها محمد - مدير إدارة النشاط العلمي بالجامعة – (01273958561) / - أ./ محمد عزت – (01220575496)',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
