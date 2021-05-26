import 'package:flutter/material.dart';
import 'package:instagrab_customer/checkout_page.dart';
import 'package:instagrab_customer/loginPage.dart';
import 'package:instagrab_customer/product_details.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagrab Customer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: HomePage(),
      routes: {
        '/': (context) => LoginPage(),
        HomePage.routeName:(context)=>HomePage(),
        ProductDetail.routeName: (context)=>ProductDetail(),
        CheckoutPage.routeName: (context)=>CheckoutPage(),

      },
    );
  }
}
