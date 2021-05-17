import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class Lec extends StatefulWidget {
  @override
  _LecState createState() => _LecState();
}

class _LecState extends State<Lec> {
  var pagename = 'الجدول الدراسي';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('$pagename')),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => EntryItem(
            data[index],
          ),
        ));
  }
}

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  // Second Row
  Entry('الأحد', <Entry>[
    Entry('ادارة عمليات وشركات سفر الساعة 9 الي 11'),
    Entry('لغة اجنبية ثانية الساعة 11 الي 12'),
  ]),
  Entry('الاثنين', <Entry>[
    Entry('حاسب الي من الساعة 1 الي 2'),
  ]),
  Entry('الثلاثاء', <Entry>[
    Entry('بيئة مصرية الساعة 11 الي 1'),
  ]),
  Entry('الاربعاء', <Entry>[
    Entry('لا يوجد'),
  ]),
  Entry('الخميس', <Entry>[
    Entry('ادارة عمليات وشركات سفر الساعة 9 الي 11'),
    Entry('لغة اجنبية ثانية الساعة 11 الي 12'),
  ]),
  Entry('السبت', <Entry>[
    Entry('لا يوجد'),
  ]),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
