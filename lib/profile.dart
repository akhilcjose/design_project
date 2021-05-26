import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map userDetails;

  _sendMail() async {
    // Android and iOS
    const uri =
        'mailto:instagrab@gmail.com?subject=FeedBack/Suggestion&body=Hi Team Instagrab,\n';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      print("Could not launch $uri");
      throw 'Could not launch $uri';
    }
  }

  @override
  void initState() {
    userDetails = {
      'profile_image_url':
          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
      'first_name': "Thomas",
      'id': '123',
      'username': '9998887774',
      'instagram_id': 'allen.jiji',
      'email':'allenjiji2604@gmail.com'
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(userDetails['profile_image_url']),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      userDetails['first_name'],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "UID: ${userDetails['id']}",
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    userDetails['email'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onTap: () =>
                  null /* Navigator.of(context)
                            .pushNamed(ChangeEmail.routeName, arguments: {
                          'id': userDetails['id'],
                          'email': userDetails['email'],
                          'callback': (String em) =>
                              setState(() => userDetails['email'] = em)
                        }) */
              ),
          ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Phone number"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    userDetails['username'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onTap: () =>
                  null /*  Navigator.of(context)
                            .pushNamed(ChangePhone.routeName, arguments: {
                          'id': userDetails['id'],
                          'phone': userDetails['username'],
                          'callback': (String ph) =>
                              setState(() => userDetails['username'] = ph)
                        }) */
              ),
          ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Instagram ID"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    userDetails['instagram_id'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onTap: () =>
                  null /* Navigator.of(context)
                            .pushNamed(ChangeInstagramID.routeName, arguments: {
                          'id': userDetails['id'],
                          'igid': userDetails['instagram_id'],
                          'callback': (String em, String propicurl) =>
                              setState(() {
                                userDetails['instagram_id'] = em;
                                userDetails['profile_image_url'] = propicurl;
                              })
                        }) */
              ),
/*                 ListTile(
                    leading: Icon(Icons.confirmation_number),
                    title: Text("FSSAI number"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          userDetails['fssai_number'],
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    onTap: () => Navigator.of(context)
                            .pushNamed(ChangeFSSAINumber.routeName, arguments: {
                          'id': userDetails['id'],
                          'fssai': userDetails['fssai_number'],
                          'callback': (String em) =>
                              setState(() => userDetails['fssai'] = em)
                        })), */
          /*  ListTile(
              leading: Icon(Icons.cloud_circle),
              title: Text("Delivery Range"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${userDetails['delivery_radius']} km',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onTap: () =>
                  null /*  Navigator.of(context).pushNamed(
                            ChangeDeliveryRange.routeName,
                            arguments: {
                              'id': userDetails['id'],
                              'delrange': userDetails['delivery_radius'],
                              'callback': (String em) => setState(
                                  () => userDetails['delivery_radius'] = em)
                            }) */
              ),
          ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Address"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () =>
                  null /* Navigator.of(context)
                      .pushNamed(ChangeAddress.routeName, arguments: {
                    'id': userDetails['id'],
                    'address': userDetails['line'],
                    'city': userDetails['city'],
                    'district': userDetails['district'],
                    'pincode': userDetails['pincode'].toString(),
                    'latitude': userDetails['latitude'],
                    'longitude': userDetails['longitude'],
                    'callback': (String line, String city, String district,
                        String pincode, double latitude, double longitude) {
                      userDetails['line'] = line;
                      userDetails['city'] = city;
                      userDetails['pincode'] = district;
                      userDetails['pincode'] = pincode;
                      userDetails['latitude'] = latitude;
                      userDetails['longitude'] = longitude;
                    }
                  }), */
              ),
          ListTile(
              leading: Icon(Icons.panorama_fish_eye),
              title: Text("Available Pan Sizes"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () =>
                  null /* Navigator.pushNamed(
                      context, SelectPansize.routeName,
                      arguments: {
                        'update': true,
                        'id': userDetails['id'],
                        'selsizes': _selectedPansizes,
                        'callback': (List<Map> pans) => _selectedPansizes = pans
                      }), */
              ),
          ListTile(
              leading: Icon(Icons.format_shapes),
              title: Text("Available Shapes"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () =>
                  null /* Navigator.pushNamed(
                      context, SelectShapes.routeName,
                      arguments: {
                        'update': true,
                        'id': userDetails['id'],
                        'selshapes': _selectedShapes,
                        'callback': (List<Map> shapes) =>
                            _selectedShapes = shapes
                      }), */
              ), */
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback/Suggestions"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: _sendMail,
          ),
          ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () =>
                  null /* prov.logout().then((value) =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/', (Route<dynamic> route) => false)), */
              )
        ],
      ),
    );
  }
}
