import 'package:flutter/material.dart';
import 'dart:convert';

final GlobalKey<ScaffoldState> _selshapeskey = new GlobalKey<ScaffoldState>();

class SelectTags extends StatefulWidget {
  static const routeName = '/SelectTagsPage';
  @override
  _SelectTagsState createState() => _SelectTagsState();
}

class _SelectTagsState extends State<SelectTags> {
  List<String> _shapes = [
    'Fashion',
    'Shoes',
    'Men\'s Fashion',
    'Women\'s Fashion',
    'Watches',
    'Food',
    'Tech',
    'Sports',
    'Fitness',
    'Gym',
    'Art',
    'Gaming'
  ];
  List<int> _selectIndex = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _selshapeskey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 10,
        title: Text(
          'Select Tags',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () {
                if (_selectIndex.isEmpty) {
                  _selshapeskey.currentState.showSnackBar(SnackBar(
                    content: Text('No Tags are selected'),
                  ));
                  return;
                }
                Navigator.pop(context);
              })
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: GridView.builder(
            itemCount: _shapes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2),
            itemBuilder: (context, index) {
              bool _hasit = _selectIndex.contains(index);
              return InkWell(
                onTap: () {
                  setState(() {
                    _hasit
                        ? _selectIndex.remove(index)
                        : _selectIndex.add(index);
                  });
                  print(_selectIndex);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: _hasit ? Color(0xFF2962FF) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      _shapes[index],
                      style: TextStyle(
                          color: _hasit ? Colors.white : Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
