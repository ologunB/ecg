import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/views/user/home/home_view.dart';
import 'package:ecgalpha/views/user/home/notification_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeView extends StatefulWidget {
  AdminHomeView({Key key}) : super(key: key);

  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                "assets/images/person.png",
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: FutureBuilder(
                                  future: name,
                                  builder: (context, snap) {
                                    if (snap.connectionState ==
                                        ConnectionState.done) {
                                      return Text(
                                        "Good ${greeting()}, ${snap.data}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      );
                                    }
                                    return Text(
                                      "Good ${greeting()}  ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(Icons.notifications),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          NotificationPage()));
                            }),
                      )
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      item("amount", types[0]),
                      item("amount", types[1]),
                      item("amount", types[2]),
                      item("amount", types[3]),
                      item("amount", types[4]),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> types = [
  "Today's Total",
  "Today's Pending",
  "Today's Confirmed",
  "Paid",
  "Unpaid"
];

Widget item(String amount, String type) => Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent[100],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              type,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              amount,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
            SizedBox(height: 7),
          ],
        ),
      ),
    );
