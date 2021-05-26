import 'package:flutter/material.dart';

class SortBottomSheet extends StatefulWidget {
  final bool isProduct;

  SortBottomSheet(this.isProduct);
  @override
  _SortBottomSheetState createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _selectedsorttile, _ascdesc;
  String url;
  final List<String> _orderlist = ['Acsending', 'Descending'],
      _orderkey = ['', '-'];
  List<String> _sortvalues, _sortkey;

  @override
  void initState() {
    if (widget.isProduct) {
      _sortvalues = ['Price', 'Order', 'Date Added'];
      _sortkey = ['offer_price', 'order_count', 'date_added'];
      url = 'http://142.93.210.165/baker/productlist/';
    } else {
      _sortvalues = ['Price', 'Date Added'];
      _sortkey = ['cake_customization__product__offer_price', 'ordered_date'];
      url = 'http://142.93.210.165/baker/order/';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView(
        children: <Widget>[
          Text(
            'Sort by',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 10,
          ),
          ...List.generate(
              _sortvalues.length,
              (index) => RadioListTile(
                    value: index,
                    groupValue: _selectedsorttile,
                    title: Text(_sortvalues[index]),
                    onChanged: (val) => setState(() => _selectedsorttile = val),
                    activeColor: Color(0xFF2962FF),
                  )),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Order',
                  style: TextStyle(color: Colors.grey[600], fontSize: 20),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          ...List.generate(
              2,
              (index) => RadioListTile(
                    value: index,
                    groupValue: _ascdesc,
                    title: Text(_orderlist[index]),
                    onChanged: (val) => setState(() => _ascdesc = val),
                    activeColor: Color(0xFF2962FF),
                  )),
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
                    Navigator.pop(context);
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
