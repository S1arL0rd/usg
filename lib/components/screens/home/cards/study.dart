import 'package:flutter/material.dart';

class Study extends StatefulWidget {
  @override
  _StudyState createState() => _StudyState();
}

class _StudyState extends State<Study> {
  var pagename = 'المذاكرة';
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
    Entry('لا يوجد'),
  ]),
  Entry('الاثنين', <Entry>[
    Entry('لا يوجد'),
  ]),
  Entry('الثلاثاء', <Entry>[
    Entry('لا يوجد'),
  ]),
  Entry('الاربعاء', <Entry>[
    Entry('لا يوجد'),
  ]),
  Entry('الخميس', <Entry>[
    Entry('لا يوجد'),
  ]),
  Entry('السبت', <Entry>[
    Entry(
      'لا يوجد',
    ),
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
