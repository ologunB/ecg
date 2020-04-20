import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/user/home/home_view.dart';
import 'package:ecgalpha/views/user/orders/order_view.dart';
import 'package:ecgalpha/views/user/partials/create_investment.dart';
import 'package:ecgalpha/views/user/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutTemplate extends StatefulWidget {
  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  int pageSelectedIndex = 0;

  final List<Widget> pages = [
    HomeView(
      key: PageStorageKey('Page1'),
    ),
    OrdersView(
      key: PageStorageKey('Page2'),
    ),
    ProfileView(
      key: PageStorageKey('Page3'),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: pages[pageSelectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 15,
          onTap: (i) {
            setState(() {
              pageSelectedIndex = i;
            });
          },
          currentIndex: pageSelectedIndex,
          selectedItemColor: Styles.appPrimaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                title: Text("Investment",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.appPrimaryColor,
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => CreateInvestment()));
        },
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}
