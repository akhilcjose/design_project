import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagrab_influencers/pages/productDetailsPage.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map> posts = [
    {
      'id': '32',
      'image320':
          'https://vidooly.com/blog/wp-content/uploads/2019/05/usaamah.jpg',
      'name': 'Raymond Men\'s Comfort Edition',
      'offer_price': '13,0000',
      'actual_price': '13,000',
      'rating': '5',
      'order_count': '1498'
    },
    {
      'id': '35',
      'image320':
          'https://static.nc-myus.com/images/pub/www/uploads/image/2758c4b4f5714d55974edede913ee04f/Sania_Garg_1.PNG',
      'name': 'Seemati Women\'s Top',
      'offer_price': '5,000',
      'actual_price': '5,000',
      'rating': '4.5',
      'order_count': '1987'
    }
  ];

  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Proddeta.routeName, arguments: posts[index]);
              },
              isThreeLine: true,
              contentPadding: EdgeInsets.all(5),
              leading: ClipRRect(
                  child: Image.network(
                    posts[index]['image320'],
                    //height: 0.5 * height,
                    //width: 0.25 * width,
                    //fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10), bottom: Radius.circular(10))),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  posts[index]['name'],
                ),
              ),
              subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "₹ ${posts[index]['actual_price']}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.green),
                    ),
                    Column(
                      children: [
                        posts[index]['rating'] == null
                            ? Text('Not Rated')
                            : Row(
                                children: [
                                  Text("${posts[index]['rating']}"),
                                  Icon(
                                    Icons.star,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
                                  )
                                ],
                              ),
                        Text("${posts[index]['order_count']} Orders")
                      ],
                    )
                  ]),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          );
        },
      ),
    );
  }
}
