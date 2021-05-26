import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String url, price, status, date, productName, sellerName;
  final Function ontap;
  OrderTile(
      {this.url,
      this.price,
      this.date,
      this.productName,
      this.status,
      this.sellerName,
      this.ontap});
  @override
  Widget build(BuildContext context) {
    print(price);
    print(date);
    print(productName);
    print(status);
    print(sellerName);
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
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text(date), Text("Status: $status")],
          ),
        ),
        onTap: ontap,
      ),
    );
  }
}
