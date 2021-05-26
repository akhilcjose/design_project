import 'package:flutter/material.dart';
import 'package:instagrab_influencers/tabs/dashboard.dart';
import 'package:instagrab_influencers/tabs/offerList.dart';
import 'package:instagrab_influencers/tabs/productList.dart';
import 'package:instagrab_influencers/tabs/profilePage.dart';

final GlobalKey<ScaffoldState> homeKey = new GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  static const routeName = '/homePage';

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  void updateTabSelection(int index) {
    print(index);
    setState(() => selectedIndex = index);
  }

  final List<Widget> _widgets = [
    Dashboard(),
    ProductList(),
    OfferList(),
    ProfilePage()
  ];
  final List<String> _title = [
    'Dashboard',
    'My Products',
    'Offers Recieved',
    'User Profile'
  ];
  final List<IconData> _bottomAppBar = [
    Icons.dashboard,
    Icons.web_asset,
    Icons.archive,
    Icons.account_circle
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: homeKey,
      appBar: AppBar(
        elevation: 3,
        title: Text(_title[selectedIndex]),
        automaticallyImplyLeading: false,
      ),
      body: _widgets[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                _bottomAppBar.length,
                (index) => Padding(
                      padding: EdgeInsets.all(5),
                      child: IconButton(
                        onPressed: () => updateTabSelection(index),
                        iconSize: 27.0,
                        icon: Icon(
                          _bottomAppBar[index],
                          color: selectedIndex == index
                              ? Colors.black //Theme.of(context).primaryColor
                              : Colors.grey.shade400,
                        ),
                      ),
                    )),
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
