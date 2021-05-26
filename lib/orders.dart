import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagrab_customer/widgets/order_tile.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _orders = [
      {
        'img_url':
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
        'seller': 'appario retailers',
        'date': '12-12-2020',
        'status': 'On its Way',
        'name': 'Bass Boosted HeadSet',
        'price': '458'
      },
      {
        'img_url':
            'https://imgaz3.staticbg.com/thumb/view/oaupload/banggood/images/41/92/fa4166ac-11e0-4a0a-8fc4-6f6b3b329ba1.jpeg',
        'seller': 'Sas Designs',
        'date': '22-11-2020',
        'status': 'Delivered',
        'name': 'Cotton Cool T-shirt',
        'price': '2999'
      },
    ];
    return Container(
      //color: Colors.white,
      child: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          return OrderTile(
            url: _orders[index]['img_url'],
            sellerName: _orders[index]['seller'],
            date: _orders[index]['date'],
            productName: _orders[index]['name'],
            price: _orders[index]['price'],
            status: _orders[index]['status'],
            ontap: () {
              //Navigator.of(context).pushNamed(
              //    OrderDetailsPage.routeName,
              //    arguments: posts[index]['id']);
            },
          );
        },
      ),
    );
  }
}
