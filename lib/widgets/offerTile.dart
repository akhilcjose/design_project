import 'package:flutter/material.dart';

class OfferTile extends StatelessWidget {
  final String url, price, date, productName, customerName;
  OfferTile({
    this.url,
    this.price,
    this.date,
    this.productName,
    this.customerName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        isThreeLine: true,
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10), child: Image.network(url)),
        title: Text(
          productName,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('₹ 34,799'), Text('For $customerName')],
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text(date), Text("Status: Active")],
          ),
        ),
      ),
    );
  }
}
