import 'package:flutter/material.dart';
import 'package:instagrab_influencers/pages/homePage.dart';
import 'package:instagrab_influencers/pages/selectTags.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = '/registrationPage';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _name = FocusNode();
  final _phone = FocusNode();
  final _password = FocusNode();
  final _confpassword = FocusNode();
  final _accNo = FocusNode();
  final _ifsc = FocusNode();

  bool _isValid = false;
  final _formreg = GlobalKey<FormState>();
  Map<String, dynamic> _check = {};
  void _saveform() {
    _isValid = _formreg.currentState.validate();
    if (!_isValid) {
      return;
    }
    _formreg.currentState.save();
    print(_check);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _password.dispose();
    _confpassword.dispose();
    _accNo.dispose();
    _ifsc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 37, 40, 1),
        body: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  height: 0.9 * height,
                  width: 0.85 * width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Form(
                      key: _formreg,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Additional Details',
                            style: TextStyle(fontSize: 20),
                          ),
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Enter your E-mail address',
                                        prefixIcon: Icon(Icons.email),
                                        fillColor: Colors.grey[300],
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none)),
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) =>
                                        _phone.requestFocus(),
                                    validator: (value) =>
                                        value.isEmpty ? "Invalid Email" : null,
                                    onSaved: (newValue) {
                                      print(newValue);
                                      _check['email'] = newValue;
                                    }),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Enter your Phone Number',
                                      prefixIcon: Icon(Icons.phone),
                                      fillColor: Colors.grey[300],
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none)),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) => _name.requestFocus(),
                                  validator: (value) => value.length != 10
                                      ? "Enter a valid Phone Number"
                                      : null,
                                  onSaved: (newValue) =>
                                      _check['phone'] = newValue,
                                  focusNode: _phone,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Enter your Charge (In Rupees)',
                                      prefixIcon: Icon(Icons.person),
                                      fillColor: Colors.grey[300],
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none)),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (_) =>
                                      _accNo.requestFocus(),
                                  validator: (value) => value.isEmpty
                                      ? "Enter a valid Charge"
                                      : null,
                                  onSaved: (newValue) =>
                                      _check['name'] = newValue,
                                  focusNode: _name,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Enter your Account Number',
                                      prefixIcon: Icon(Icons.account_balance),
                                      fillColor: Colors.grey[300],
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none)),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) => _ifsc.requestFocus(),
                                  validator: (value) =>
                                      value.length <= 8 || value.length >= 20
                                          ? "Invalid Account Number"
                                          : null,
                                  onSaved: (newValue) =>
                                      _check['accNo'] = newValue,
                                  focusNode: _accNo,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, SelectTags.routeName),
                                  child: Container(
                                    height: 50,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Select Tags'),
                                        Icon(Icons.navigate_next)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Enter your IFSC Code',
                                      prefixIcon: Icon(Icons.code),
                                      fillColor: Colors.grey[300],
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none)),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      _password.requestFocus(),
                                  validator: (value) =>
                                      value.length <= 8 || value.length >= 20
                                          ? "Invalid IFSC Code"
                                          : null,
                                  onSaved: (newValue) =>
                                      _check['ifsc'] = newValue,
                                  focusNode: _ifsc,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText:
                                          'Enter your Account Holder Name',
                                      prefixIcon: Icon(Icons.lock),
                                      fillColor: Colors.grey[300],
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none)),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      _confpassword.requestFocus(),
                                  validator: (value) =>
                                      value.length <= 5 ? "Invalid Name" : null,
                                  onSaved: (newValue) =>
                                      _check['acholdername'] = newValue,
                                  focusNode: _password,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Enter your Bank Name',
                                      prefixIcon: Icon(Icons.lock),
                                      fillColor: Colors.grey[300],
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none)),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) =>
                                      value.length <= 5 ? "Invalid Name" : null,
                                  onSaved: (newValue) =>
                                      _check['confpass'] = newValue,
                                  focusNode: _confpassword,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black,
                                      ),
                                      width: 0.3 * width,
                                      child: MaterialButton(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          _saveform();

                                          Navigator.of(context)
                                              .pushNamed(Home.routeName);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ))));
  }
}
