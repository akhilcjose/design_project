import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:instagrab_customer/product_details.dart';
import 'package:instagrab_customer/widgets/filterBottomSheet.dart';
import 'package:instagrab_customer/widgets/product_tile.dart';
import 'package:instagrab_customer/size_config.dart';
import 'package:instagrab_customer/widgets/sortBottomSheet.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController controller = TextEditingController();
  List<Map<String, String>> _products;
  @override
  void initState() {
    _products = [
      {
        'name': 'Bass Boosted Headset',
        'price': '569',
        'seller': 'Appario Retialers',
        'influencer': 'thetechy',
        'details':
            'Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
        'img_url':
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
      },
      {
        'name': 'Cotton Cool T-shirt',
        'price': '2999',
        'seller': 'Sas Designs',
        'influencer': 'mens_fashions',
        'details':
            'Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
        'img_url':
            'https://imgaz3.staticbg.com/thumb/view/oaupload/banggood/images/41/92/fa4166ac-11e0-4a0a-8fc4-6f6b3b329ba1.jpeg'
      },
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
      {
        'name': 'Oil Painting',
        'price': '5999',
        'seller': 'Art Crafter',
        'influencer': 'art_is_life',
        'details':
            'Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
        'img_url':
            'https://d3rf6j5nx5r04a.cloudfront.net/4kSYXpqbEOoGA_ThTQ0B8Bjqssc=/760x370/product/1/0/9d18d06b7bc44a0cad18ab2850a1e158_opt.jpg'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            //height: MediaQuery.of(context).size.height,
            child: ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return ProductTile(
              productName: _products[index]['name'],
              imageUrl: _products[index]['img_url'],
              sellerName: _products[index]['seller'],
              price: _products[index]['price'],
              influencer: _products[index]['influencer'],
              ontap: () {
                Navigator.of(context).pushNamed(ProductDetail.routeName,
                    arguments: _products[index]);
              },
            );
          },
        )),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              animatedIconTheme: IconThemeData(size: 22.0),
              curve: Curves.bounceIn,
              tooltip: 'Speed Dial',
              heroTag: 'speed-dial-hero-tag',
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              overlayOpacity: 0,
              elevation: 8.0,
              shape: CircleBorder(),
              children: [
                SpeedDialChild(
                    child: Icon(Icons.sort),
                    backgroundColor: Colors.red,
                    label: 'Sort',
                    onTap: () => showModalBottomSheet(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(20.0),
                                topRight: const Radius.circular(20.0)),
                          ),
                          context: context,
                          builder: (context) => SortBottomSheet(
                            false,
                          ),
                        )),
                SpeedDialChild(
                    child: Icon(Icons.filter),
                    backgroundColor: Colors.green,
                    label: 'Filter',
                    onTap: () => showModalBottomSheet(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(20.0),
                                topRight: const Radius.circular(20.0)),
                          ),
                          context: context,
                          builder: (context) => FilterBottomSheet(false),
                        )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
