import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagrab_influencers/pages/orderDetailsPage.dart';
import './pages/additionalDetails.dart';
import './pages/change-accountdetailsPage.dart';
import './pages/change-phonepage.dart';
import './pages/changeEmailPage.dart';
import './pages/loginPage.dart';
import './pages/productDetailsPage.dart';
import './pages/selectTags.dart';

import './pages/homePage.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFFFFFFFF, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagrab',
      theme: ThemeData(
          primarySwatch: colorCustom,
          accentColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: GoogleFonts.openSans(
                fontSize: 72.0, fontWeight: FontWeight.bold),
            // headline6:
            //     TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      routes: {
        "/": (ctx) => LoginPage(),
        ChangeAccountDetails.routeName: (ctx) => ChangeAccountDetails(),
        ChangeEmail.routeName: (ctx) => ChangeEmail(),
        ChangePhone.routeName: (ctx) => ChangePhone(),
        RegistrationPage.routeName: (ctx) => RegistrationPage(),
        Orderdeta.routeName: (ctx) => Orderdeta(),
        Proddeta.routeName: (ctx) => Proddeta(),
        SelectTags.routeName: (ctx) => SelectTags(),
        Home.routeName: (ctx) => Home()
      },
    );
  }
}
