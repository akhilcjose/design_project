import 'package:flutter/material.dart';

class SmallBox extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle style;
  SmallBox({this.title, this.value, this.style});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("$title"),
              width: w * 0.4,
            ),
            Container(
              width: w * 0.4,
              child: Text(
                "$value",
                textAlign: TextAlign.end,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
