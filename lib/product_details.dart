import 'package:flutter/material.dart';
import 'package:instagrab_customer/checkout_page.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetail extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static const routeName = 'product-details';
  _launchURL() async {
    String url = 'https://bakesbee.com/store/product-details/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: [
          Image.network(arg['img_url']),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(arg['name'],
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Divider(),
          Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "₹${arg['price']}",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.green, fontSize: 80),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sold By: ${arg['seller']}"),
                      Text("From: ${arg['influencer']}")
                    ],
                  )
                ],
              )),
          Divider(),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "DETAILS",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  arg['details'],
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 15),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "See Orginal Post On Instagram",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.red,
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text('Added to Cart'),
                ));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(CheckoutPage.routeName);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  color: Colors.green[300],
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
