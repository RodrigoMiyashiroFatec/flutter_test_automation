import 'package:flutter/material.dart';

class Temporary extends StatefulWidget {
  @override
  _TemporaryState createState() => _TemporaryState();
}

class _TemporaryState extends State<Temporary> {
  final List<String> _items = List<String>.generate(100, (position) => "Item $position");
  final String _titleTemporary = 'Temporary View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleTemporary),
      ),
      body: ListView.builder(
        key: Key('list_temporary'),
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            key: Key('item_${index}_text'),
            title: Text('${_items[index]}'),
          );
        },
      ),
    );

//    return MaterialApp(
//      title: _titleTemporary,
//      home: ,
//    );
  }
}
