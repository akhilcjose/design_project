import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilterBottomSheet extends StatefulWidget {
  @override
  final bool isProduct;
  //final Function callback;
  FilterBottomSheet(this.isProduct, );
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<Map> _flavours = [];
  RangeValues _currentRangeValues = const RangeValues(0, 5000);
  String _selectedFlav, _selectedCat, url;
  List<String> _filterkeys;

  List<String> _ptypes = [
    'Fashion',
    'Clothing',
    'Wearables',
    'Trending',
    'Utensils',
    'Ornaments',
    'Electronics',
    'Other'
  ];
  @override
  void initState() {
    getFlavs().then((value) => setState(() => _flavours = value as List<Map>));
    if (widget.isProduct) {
      url = 'http://142.93.210.165/baker/productlist/';
      _filterkeys = [
        'flavour__flavour',
        'product_type__type_name',
        'offer_price__gte',
        'offer_price__lte'
      ];
    } else {
      url = 'http://142.93.210.165/baker/order/';
      _filterkeys = [
        'cake_customization__product__flavour__flavour',
        'cake_customization__product__product_type__type_name',
        'total__gte',
        'total__lte'
      ];
    }
    super.initState();
  }

  Future<List> getFlavs() async {
    final url = 'http://142.93.210.165/baker/flavour/';
    final response = await http.get(url);
    print(response.body);
    List<Map> pps = [];
    List _flavs = json.decode(response.body);
    _flavs.forEach((element) {
      pps.add(element as Map);
    });
    return pps;
    // return _flavs;
    //print("hello" + _pansize.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(color: Color(0xfff3f3f4)),
                  // width:  ,
                  child: DropdownButtonHideUnderline(
                    child: Theme(
                      data: ThemeData(
                          highlightColor: Color.fromRGBO(101, 141, 251, 1),
                          // canvasColor: Colors.red,
                          primaryColor: Colors.black,
                          accentColor: Colors.black,
                          hintColor: Colors.black),
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          isDense: true,
                          hint: new Text("Select Category"),
                          value: _selectedCat,
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedCat = newValue;
                            });
                          },
                          items: _ptypes.map((String name) {
                            return new DropdownMenuItem<String>(
                                value: name,
                                // value: _mySelection,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(name),
                                ));
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Price Range',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    // height: 50,
                    // decoration: BoxDecoration(color: Color(0xfff3f3f4)),
                    // width:  ,
                    child: RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 5000,
                      divisions: 10,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                        // print(_currentRangeValues.start.toString());
                      },
                    )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  color: Color(0xFF2962FF),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                  onPressed: () {
                    String qparam = '';
                    if (_selectedFlav != null)
                      qparam += '${_filterkeys[0]}=$_selectedFlav&';
                    if (_selectedCat != null)
                      qparam += '${_filterkeys[1]}=$_selectedCat&';
                    if (_currentRangeValues.start != 0)
                      qparam +=
                          '${_filterkeys[2]}=${_currentRangeValues.start}&';
                    if (_currentRangeValues.end != 5000)
                      qparam += '${_filterkeys[3]}=${_currentRangeValues.end}&';
                    print(_currentRangeValues.start.toString());
                    print(_currentRangeValues.end.toString());
                    Navigator.pop(context);
                    print('$url?$qparam');
                    //widget.callback('$url?$qparam');
                  },
                  color: Color(0xFF2962FF),
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
