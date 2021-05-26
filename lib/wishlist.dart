import 'package:flutter/material.dart';
import 'package:instagrab_customer/product_details.dart';
import 'package:instagrab_customer/widgets/general_tile.dart';

class WishlistPage extends StatelessWidget {
  List _items = [
    {
        'name': 'Antique Earings',
        'price': '1999',
        'seller': 'Sas Jewellers',
        'influencer': 'fashionbeauty',
        'details':
            'Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
        'img_url':
            'https://res.cloudinary.com/purnesh/image/upload/v1459771696/drizziling-jewels05599-1920-high.jpg'
      },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return GeneralTile(
            url: _items[index]['img_url'],
            productName: _items[index]['name'],
            price: _items[index]['price'],
            ontap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetail.routeName, arguments: _items[index]);
            },
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
