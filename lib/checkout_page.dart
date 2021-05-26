import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagrab_customer/home.dart';

class CheckoutPage extends StatefulWidget {
  static const routeName = '/CheckoutPage';

  CheckoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _phone = FocusNode();
  final _password = FocusNode();
  final _confpassword = FocusNode();
  final _lname = FocusNode();
  final _email = FocusNode();
  final _pasController = TextEditingController();

  bool _isValid = false, _obscureText1 = true, _obscureText2 = true;

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
    _phone.dispose();
    _password.dispose();
    _confpassword.dispose();
    _lname.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
        ),
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formreg,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Quantity',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      _lname.requestFocus(),
                                  validator: (value) => value.length < 3
                                      ? "Invalid Quantity"
                                      : null,
                                  onSaved: (newValue) =>
                                      _check['fname'] = newValue)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Address',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true),
                                  focusNode: _lname,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      _email.requestFocus(),
                                  validator: (value) => value.length < 3
                                      ? "Invalid Address"
                                      : null,
                                  onSaved: (newValue) =>
                                      _check['lname'] = newValue)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Pincode',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true),
                                  focusNode: _email,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      _phone.requestFocus(),
                                  onSaved: (newValue) =>
                                      _check['email'] = newValue)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Contact Phone',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true),
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  focusNode: _phone,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      _password.requestFocus(),
                                  validator: (value) => value.length != 10
                                      ? "Enter a valid Phone Number"
                                      : null,
                                  onSaved: (newValue) =>
                                      _check['phone'] = newValue)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(2, 4),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).primaryColor
                                    ])),
                            child: Text(
                              'Place Order',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          onTap: () {
                            _saveform();
                            if (_isValid) {
                              print('hey');
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              homeKey.currentState.showSnackBar(SnackBar(
                                content: Text("Order Placed"),
                              ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
