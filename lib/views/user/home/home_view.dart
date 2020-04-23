import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/models/investment.dart';
import 'package:ecgalpha/utils/carousel_slider.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/partials/each_order_item.dart';
import 'package:ecgalpha/views/user/partials/create_investment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notification_page.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

Widget middleItem(String type, String amount, String time) => Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent[100],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(25),
          ),
        ),
        child: FlatButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                type,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              SizedBox(height: 15),
              Text(
                "₦ $amount",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    time,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

class _HomeViewState extends State<HomeView> {
  int totalExpecting = 0;
  String expectingTime;
  int todayPending = 0;
  String todayPendingTime;
  int todayConfirmed = 0;
  String todayConfirmedTime;
  int totalPending = 0;
  String totalPendingTime;
  int totalConfirmed = 0;
  String totalConfirmedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: CachedNetworkImage(
                            imageUrl: MY_IMAGE.isEmpty ? "ma" : MY_IMAGE,
                            height: 50,
                            width: 50,
                            placeholder: (context, url) => ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Image(
                                  image: AssetImage("assets/images/person.png"),
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain),
                            ),
                            errorWidget: (context, url, error) => ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Image(
                                  image: AssetImage("assets/images/person.png"),
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Good ${greeting()}, $MY_NAME",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NotificationPage()));
                        }),
                  )
                ],
              ),
              CarouselSlider(
                height: MediaQuery.of(context).size.height / 4,
                autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                pauseAutoPlayOnTouch: Duration(seconds: 5),
                items: [
                  "assets/images/placeholder.png",
                  "assets/images/placeholder.png",
                  "assets/images/placeholder.png",
                  "assets/images/placeholder.png",
                  "assets/images/placeholder.png",
                ].map((i) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          backgroundBlendMode: BlendMode.dstOut,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          image: DecorationImage(
                            image: AssetImage(""),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              child: Image(
                                image: AssetImage(i),
                                fit: BoxFit.fill,
                                color: Colors.black38,
                                colorBlendMode: BlendMode.dstOut,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Advertise on this space",
                                  style: TextStyle(
                                      backgroundColor: Colors.blueAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                child: Text(
                  "Transactions Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 155,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Transactions")
                          .document("Expecting")
                          .collection(MY_UID)
                          .orderBy("Timestamp", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                              height: 100,
                              width: 100,
                            );
                          default:
                            int i = 0;
                            if (snapshot.data.documents.isNotEmpty) {
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  expectingTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                snapshot.data.documents.length;
                                totalExpecting =
                                    totalExpecting + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem("Expecting", "0", "--"),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Expecting",
                                        commaFormat.format(totalExpecting),
                                        expectingTime),
                                  );
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Transactions")
                          .document("Pending")
                          .collection(MY_UID)
                          .orderBy("Timestamp", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                              height: 100,
                              width: 100,
                            );
                          default:
                            int i = 0;
                            if (snapshot.data.documents.isNotEmpty) {
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  todayPendingTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                snapshot.data.documents.length;
                                todayPending =
                                    todayPending + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem(
                                        "Today's Pending", "0", "--"),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Today's Pending",
                                        commaFormat.format(todayPending),
                                        todayPendingTime),
                                  );
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Transactions")
                          .document("Confirmed")
                          .collection(MY_UID)
                          .orderBy("Timestamp", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                              height: 100,
                              width: 100,
                            );
                          default:
                            int i = 0;
                            if (snapshot.data.documents.isNotEmpty) {
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  todayConfirmedTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                snapshot.data.documents.length;
                                todayConfirmed =
                                    todayConfirmed + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem(
                                        "Today's Confirmed", "0", "--"),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Today's Confirmed",
                                        commaFormat.format(todayConfirmed),
                                        todayConfirmedTime),
                                  );
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Transactions")
                          .document("Pending")
                          .collection(MY_UID)
                          .orderBy("Timestamp", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                              height: 100,
                              width: 100,
                            );
                          default:
                            int i = 0;
                            if (snapshot.data.documents.isNotEmpty) {
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  totalPendingTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                snapshot.data.documents.length;
                                totalPending =
                                    totalPending + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child:
                                        middleItem("Total Pending", "0", "--"),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Total Pending",
                                        commaFormat.format(totalPending),
                                        totalPendingTime),
                                  );
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Transactions")
                          .document("Confirmed")
                          .collection(MY_UID)
                          .orderBy("Timestamp", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                              height: 100,
                              width: 100,
                            );
                          default:
                            int i = 0;
                            if (snapshot.data.documents.isNotEmpty) {
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  totalConfirmedTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                snapshot.data.documents.length;
                                totalConfirmed =
                                    totalConfirmed + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem(
                                        "Total Confirmed", "0", "--"),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Total Confirmed",
                                        commaFormat.format(totalPending),
                                        totalConfirmedTime),
                                  );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              ListView(
                // physics: FixedExtentScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("Transactions")
                        .document("Pending")
                        .collection(MY_UID)
                        .orderBy("Timestamp", descending: true)
                        .limit(1)
                        .snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(),
                                Text(
                                  "Getting Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            height: 100,
                            width: 100,
                          );
                        default:
                          return snapshot.data.documents.isEmpty
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  child: Text("Empty"),
                                )
                              : Container(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children:
                                        snapshot.data.documents.map((document) {
                                      return EachOrderItem(
                                        investment: Investment.map(document),
                                        color: Styles.appPrimaryColor,
                                        type: "Pending",
                                      );
                                    }).toList(),
                                  ),
                                );
                      }
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("Transactions")
                        .document("Confirmed")
                        .collection(MY_UID)
                        .orderBy("Timestamp", descending: true)
                        .limit(1)
                        .snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(),
                                Text(
                                  "Getting Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            height: 100,
                            width: 100,
                          );
                        default:
                          return snapshot.data.documents.isEmpty
                              ? Container()
                              : Container(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children:
                                        snapshot.data.documents.map((document) {
                                      return EachOrderItem(
                                        investment: Investment.map(document),
                                        color: Colors.green,
                                        type: "Confirmed",
                                      );
                                    }).toList(),
                                  ),
                                );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
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

List<String> types = [
  "Expecting",
  "Today's Pending",
  "Today's Confirmed",
  "Total Pending",
  "Total Confirmed"
];

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

String timeAgo(DateTime d) {
  Duration diff = DateTime.now().difference(d);
  if (diff.inDays > 365)
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
  if (diff.inDays > 30)
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
  if (diff.inDays > 7)
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
  if (diff.inDays > 0)
    return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
  if (diff.inHours > 0)
    return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
  if (diff.inMinutes > 0)
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
  return "just now";
}
