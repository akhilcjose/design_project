import 'package:flutter/material.dart';
import 'package:instagrab_influencers/pages/change-accountdetailsPage.dart';
import 'package:instagrab_influencers/pages/change-phonepage.dart';
import 'package:instagrab_influencers/pages/changeEmailPage.dart';

class ProfilePage extends StatelessWidget {
  final Map data = {
    'name': 'Influencer',
    'id': '783',
    'email': 'email@gmail.com',
    'phone': '7907233067'
  };
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
                    backgroundImage: AssetImage('assets/influlogo.png'),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      data["name"],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "UID:${data['id']}",
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Change Email"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  data['email'],
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            onTap: () => Navigator.of(context).pushNamed(ChangeEmail.routeName),
          ),
          ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Change Phone number"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    data['phone'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(ChangePhone.routeName)),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text("Change Payment Details"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.of(context)
                  .pushNamed(ChangeAccountDetails.routeName)),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Request a Call"),
            trailing: Icon(Icons.arrow_forward_ios),
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
            onTap: () => Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
          )
        ],
      ),
    );
  }
}
