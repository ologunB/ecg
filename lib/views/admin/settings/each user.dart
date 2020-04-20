import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/admin/orders/cancelled/cancelled_order.dart';
import 'package:ecgalpha/views/admin/orders/confirmed/confirmed_order.dart';
import 'package:ecgalpha/views/admin/orders/ongoing/ongoing_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.notifications_active), onPressed: () {})
              ],
            ),
            body: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          "assets/images/person.png",
                        ),
                        backgroundColor: Colors.grey[100],
                      ),
                    ),
                    Text("ECG Admin 1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("fichardfredrick@yahoo.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total Confirmed:",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              "N23,000",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total Pending:",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              "N23,000",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total Cancelled:",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              "N23,000",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 3,
                        child: Scaffold(
                          appBar: AppBar(
                            leading: Container(),
                            flexibleSpace: SafeArea(
                              child: TabBar(
                                  isScrollable: true,
                                  unselectedLabelColor: Colors.grey[500],
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Styles.appPrimaryColor),
                                  tabs: [
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Confirmed",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Pending",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Tab(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Cancelled",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ]),
                            ),
                            iconTheme: IconThemeData(color: Colors.white),
                            backgroundColor: Colors.white,
                            elevation: 1.0,
                            centerTitle: true,
                          ),
                          body: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: TabBarView(children: [
                              ConfirmedOrders(),
                              OngoingOrders(),
                              CancelledOrders()
                            ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
