import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagrab_influencers/widgets/offerTile.dart';
import '../pages/orderDetailsPage.dart';

class OfferList extends StatefulWidget {
  @override
  _OfferListState createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  List<Map> posts = [
    {
      'image320':
          'https://cms.luxurysociety.com/media/original_images/_screen_shot_2017-08-29_at_165408_OHecgjm.png',
      'customer_name': 'Rolex International',
      'date': '18-09-2019',
      'product_name': 'Rolex Luxury Edition Watches',
      'price': '7999'
    },
    {
      'image320': 'https://dbkpacxbzpzwl.cloudfront.net/Dale/Sanne.jpg',
      'customer_name': 'Nike Shoes',
      'date': '17-09-2020',
      'product_name': 'Nike Women\'s Comfort Shoes',
      'price': '4999'
    }
  ];

  Widget build(BuildContext context) {
    // print(posts);
    return Container(
      //color: Colors.white,
      child: Stack(
        children: <Widget>[
          posts.isEmpty
              ? Center(
                  child: Text(
                    'No Orders found',
                    style: GoogleFonts.openSans(
                        color: Colors.grey[700], fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, Orderdeta.routeName,
                          arguments: posts[index]),
                      child: OfferTile(
                        url: posts[index]['image320'],
                        customerName: posts[index]['customer_name'],
                        date: posts[index]['date'].toString(),
                        productName: posts[index]['product_name'],
                        price: posts[index]['total'].toString(),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
