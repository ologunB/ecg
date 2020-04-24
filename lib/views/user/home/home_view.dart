import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/models/investment.dart';
import 'package:ecgalpha/utils/carousel_slider.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/user/orders/each_order_item.dart';
import 'package:ecgalpha/views/user/partials/create_investment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'expecting_page.dart';
import 'notification_page.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

List<Investment> expectingList = [];

Widget middleItem(String type, String amount, String time, context) => Padding(
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
          onPressed: type == "Expecting"
              ? () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ExpectingPage(
                                items: expectingList,
                              )));
                }
              : null,
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
  String expectingTime = "";
  int todayPending = 0;
  String todayPendingTime = "";
  int todayConfirmed = 0;
  String todayConfirmedTime = "";
  int totalPending = 0;
  String totalPendingTime = "";
  int totalConfirmed = 0;
  String totalConfirmedTime = "";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> uid, email, name, type, bName, aName, bNum, image;

  @override
  void initState() {
    super.initState();

    uid = _prefs.then((prefs) {
      return (prefs.getString('uid') ?? "customerUID");
    });
    email = _prefs.then((prefs) {
      return (prefs.getString('email') ?? "customerEmail");
    });
    name = _prefs.then((prefs) {
      return (prefs.getString('name') ?? "customerName");
    });
    bName = _prefs.then((prefs) {
      return (prefs.getString('Bank Name') ?? "bankName");
    });
    aName = _prefs.then((prefs) {
      return (prefs.getString('Account Name') ?? "accName");
    });
    bNum = _prefs.then((prefs) {
      return (prefs.getString('Account Number') ?? "accNum");
    });
    image = _prefs.then((prefs) {
      return (prefs.getString('image') ?? "image");
    });

    doAssign();
  }

  void doAssign() async {
    MY_NAME = await name;
    MY_UID = await uid;
    MY_EMAIL = await email;
    MY_ACCOUNT_NUMBER = await bNum;
    MY_BANK_ACCOUNT_NAME = await aName;
    MY_BANK_NAME = await bName;
    MY_IMAGE = await image;
  }

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
                              totalExpecting = 0;
                              expectingList.clear();
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                expectingList.add(item);
                                if (i == 0) {
                                  expectingTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                totalExpecting =
                                    totalExpecting + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem(
                                        "Expecting", "0", "--", context),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Expecting",
                                        commaFormat.format(totalExpecting),
                                        expectingTime,
                                        context),
                                  );
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Transactions")
                          .document("Pending")
                          .collection(MY_UID)
                          .limit(20)
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
                              todayPending = 0;
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  todayPendingTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                if (item.date == presentDate()) {
                                  todayPending =
                                      todayPending + int.parse(item.amount);
                                }
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem(
                                        "Today's Pending", "0", "--", context),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Today's Pending",
                                        commaFormat.format(todayPending),
                                        todayPendingTime,
                                        context),
                                  );
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Transactions")
                          .document("Confirmed")
                          .collection(MY_UID)
                          .limit(20)
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
                              todayConfirmed = 0;
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  todayConfirmedTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                if (item.date == presentDate()) {
                                  todayConfirmed =
                                      todayConfirmed + int.parse(item.amount);
                                }
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem("Today's Confirmed", "0",
                                        "--", context),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Today's Confirmed",
                                        commaFormat.format(todayConfirmed),
                                        todayConfirmedTime,
                                        context),
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
                              totalPending = 0;
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  totalPendingTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                totalPending =
                                    totalPending + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem(
                                        "Total Pending", "0", "--", context),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Total Pending",
                                        commaFormat.format(totalPending),
                                        totalPendingTime,
                                        context),
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
                              totalConfirmed = 0;
                              snapshot.data.documents.map((document) {
                                Investment item = Investment.map(document);
                                if (i == 0) {
                                  totalConfirmedTime = timeAgo(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.timeStamp));
                                }
                                i++;

                                totalConfirmed =
                                    totalConfirmed + int.parse(item.amount);
                              }).toList();
                            }
                            return snapshot.data.documents.isEmpty
                                ? Container(
                                    child: middleItem(
                                        "Total Confirmed", "0", "--", context),
                                  )
                                : Container(
                                    child: middleItem(
                                        "Total Confirmed",
                                        commaFormat.format(totalConfirmed),
                                        totalConfirmedTime,
                                        context),
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
                                  alignment: Alignment.center,
                                  child: Text(
                                    "No Recent",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
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
