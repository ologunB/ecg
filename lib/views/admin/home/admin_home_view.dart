import 'package:ecgalpha/views/user/home/notification_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeView extends StatefulWidget {
  AdminHomeView({Key key}) : super(key: key);

  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(children: [
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
                            Text(
                              "Hi, Mayowa",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
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
                  ListView.builder(
                    itemCount: types.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Padding(
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
                                types[i],
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "₦2000",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                              SizedBox(height: 7),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ])),
    );
  }
}

List<String> types = ["Today's Total", "Today's Pending", "Today's Confirmed"];
