import 'package:flutter/material.dart';
import 'package:instagrab_customer/orders.dart';
import 'package:instagrab_customer/profile.dart';
import 'package:instagrab_customer/shop.dart';
import 'package:instagrab_customer/your_space.dart';
final GlobalKey<ScaffoldState> homeKey = new GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    //Container(color: Colors.red),
    ShopPage(),
    //Container(color: Colors.green),
    OrdersPage(),
    //Container(color: Colors.yellow),
    YourSpacePage(),
    //Container(color: Colors.black)
    ProfilePage()
  ];
  final List<String> _pageTitles = ["Shop", "Orders", "Your Space", "Profile"];

  final List<IconData> _pageIcons = [
    Icons.dashboard,
    Icons.av_timer,
    Icons.ac_unit,
    Icons.account_circle
  ];

  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeKey,
      appBar: AppBar(
        title: Text(_pageTitles[selectedIndex]),
        actions: selectedIndex == 0
            ? [
                InkWell(
                  onTap: () => print("tapped Search"),
                  child: Icon(Icons.search_rounded),
                ),
                PopupMenuButton(
                    itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('Filter'), value: 'filter'),
                          new PopupMenuItem<String>(
                              child: const Text('Sort'), value: 'sort'),
                        ],
                    onSelected: (_) {})
              ]
            : [],
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.02,
                ),
                child: IconButton(
                  onPressed: () => updateTabSelection(index),
                  iconSize: 27.0,
                  icon: Icon(_pageIcons[index],
                      color: selectedIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.black),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
