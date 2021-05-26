import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  String productName;
  String imageUrl;
  String sellerName;
  String price;
  String postUrl;
  String influencer;
  Function ontap;

  ProductTile(
      {this.productName,
      this.imageUrl,
      this.price,
      this.sellerName,
      this.postUrl,
      this.influencer,this.ontap});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          ListTile(
            title: Text("Rs.$price"),
            trailing: InkWell(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("From:$influencer"),
                Text("[ View Post ]"),
              ],
            )),
            subtitle: Text("Sold by: $sellerName"),
            onTap: ontap,
          )
        ],
      ),
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      width: double.infinity,
      //height: MediaQuery.of(context).size.height * 0.4,
    );
  }
}
