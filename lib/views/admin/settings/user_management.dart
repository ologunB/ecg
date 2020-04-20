import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'each user.dart';

class UserManagementPage extends StatefulWidget {
  UserManagementPage({Key key}) : super(key: key);

  @override
  _UserManagementPageState createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: !isSearching,
        title: !isSearching
            ? Text(
                "All Users",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            : CupertinoTextField(
                placeholder: "Find User...",
                placeholderStyle: TextStyle(fontSize: 20, color: Colors.grey),
                //onChanged: onSearchMechanic,
                padding: EdgeInsets.all(10),

                clearButtonMode: OverlayVisibilityMode.editing,
              ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => UserProfile()));
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Daniel Richard",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Text(
                          "eddichard@yahoo.com",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          shrinkWrap: true,
          itemCount: 5,
        ),
      ),
    );
  }
}
