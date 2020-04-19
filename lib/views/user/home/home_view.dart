import 'package:ecgalpha/utils/carousel_slider.dart';
import 'package:ecgalpha/views/user/orders/each_order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notification_page.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
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
                  "assets/images/cc1.jpg",
                  "assets/images/cc2.jpg",
                  "assets/images/cc3.jpg",
                  "assets/images/cc4.jpg",
                  "assets/images/cc6.jpg",
                  "assets/images/cc7.jpg",
                  "assets/images/cc5.jpg"
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
                            fit: BoxFit.fill,
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
                              alignment: Alignment.bottomLeft,
                              child: ListTile(
                                title: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        backgroundColor: Colors.blueAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                ),
                                subtitle: Text("",
                                    style: TextStyle(
                                        backgroundColor: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueAccent)),
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
                padding: const EdgeInsets.only(bottom: 8.0, top: 18),
                child: Text(
                  "Transactions Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 150,
                width: 10000,
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: types.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Padding(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                types[i],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "₦2000",
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
                                    "4 days",
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
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0, top: 18),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return EachOrderItem();
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}

List<String> types = ["Expecting", "Total Pending", "Total Confirmed"];
