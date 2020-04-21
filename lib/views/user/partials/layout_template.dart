import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/user/home/home_view.dart';
import 'package:ecgalpha/views/user/orders/order_view.dart';
import 'package:ecgalpha/views/user/partials/create_investment.dart';
import 'package:ecgalpha/views/user/profile/profile_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutTemplate extends StatefulWidget {
  int pageSelectedIndex = 0;
  LayoutTemplate({this.pageSelectedIndex});
  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
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
        child: pages[widget.pageSelectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 15,
          onTap: (i) {
            setState(() {
              widget.pageSelectedIndex = i;
            });
          },
          currentIndex: widget.pageSelectedIndex,
          selectedItemColor: Styles.appPrimaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.home),
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.creditCard),
                title: Text("Investment",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.person),
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
