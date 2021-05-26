import 'package:flutter/material.dart';

class GeneralTile extends StatelessWidget {
  final String url, price, productName;
  final Function ontap;
  final Icon icon;
  GeneralTile(
      {this.url,
      this.price,
      this.productName,
      this.ontap,
      this.icon});
  @override
  Widget build(BuildContext context) {
    print(price);
    print(productName);
    print(url);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        //isThreeLine: true,
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10), child: Image.network(url)),
        title: Text(
          productName,
          //overflow: TextOverflow.ellipsis,
        ),
        /*   subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('₹ $price'), Text('From $sellerName')],
        ), */
        subtitle: Text('Rs $price'),
        trailing: icon,
        onTap: ontap,
      ),
    );
  }
}
