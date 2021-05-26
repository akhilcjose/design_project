import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagrab_influencers/pages/additionalDetails.dart';
import 'package:instagrab_influencers/pages/homePage.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ispnoerror = false, ispassworderror = false;
  TextEditingController pno, password;

  @override
  void initState() {
    pno = new TextEditingController();
    password = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pno.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(76, 232, 238, 1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                width: 0.7 * width,
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/iglogo.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(
                        'Login with Instagram',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, RegistrationPage.routeName),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
