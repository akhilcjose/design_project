import 'package:flutter/material.dart';
import 'package:instagrab_customer/cart.dart';
import 'package:instagrab_customer/wishlist.dart';

class YourSpacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors
                    .green, //Theme.of(context).primaryColor.withOpacity(.5),
                child: TabBar(
                    onTap: (index) {
                      // Tab index when user select it, it start from zero
                    },
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.shopping_cart_rounded),
                            Text("CART"),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.favorite_border),
                            Text("WISHLIST"),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                child: TabBarView(children: [
                  CartPage(),
                  WishlistPage(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
