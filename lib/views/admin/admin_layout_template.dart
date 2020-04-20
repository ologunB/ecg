import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/admin/orders/order_view.dart';
import 'package:ecgalpha/views/admin/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/admin_home_view.dart';

class AdminLayoutTemplate extends StatefulWidget {
  @override
  _AdminLayoutTemplateState createState() => _AdminLayoutTemplateState();
}

class _AdminLayoutTemplateState extends State<AdminLayoutTemplate> {
  int pageSelectedIndex = 0;

  final List<Widget> pages = [
    AdminHomeView(
      key: PageStorageKey('Page1'),
    ),
    OrdersView(
      key: PageStorageKey('Page2'),
    ),
    SettingsView(
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
                title: Text("Investments",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("Settings",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
          ]),
    );
  }
}
