import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/models/help_support.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/views/partials/custom_button.dart';
import 'package:ecgalpha/views/user/profile/help_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  _ListViewNoteState createState() => _ListViewNoteState();
}

class _ListViewNoteState extends State<HelpPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Tickets List",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomButton(
                title: "  Create Ticket  ",
                onPress: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) {
                        return HelpAndSupport();
                      },
                    ),
                  );
                },
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("Help Collection")
                        .document("Unresolved")
                        .collection(MY_UID)
                        .orderBy("Timestamp")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(height: 30),
                                Text(
                                  "Getting Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                            height: 300,
                            width: 300,
                          );
                        default:
                          return snapshot.data.documents.isEmpty
                              ? Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      //  Image.asset("assets/images/confirmed.png"),
                                      // SizedBox(height: 30),
                                      Text(
                                        "No Ticket yet",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 22),
                                      ),
                                      SizedBox(height: 30),
                                    ],
                                  ),
                                )
                              : ListView(
                                  children:
                                      snapshot.data.documents.map((document) {
                                    Support item = Support.map(document);
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(color: Colors.black12)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: ListTile(
                                              title: Row(
                                                children: <Widget>[
                                                  Text(
                                                    item.date,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    item.date,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black54),
                                                  )
                                                ],
                                              ),
                                              subtitle: Text(
                                                item.date,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              leading: CachedNetworkImage(
                                                imageUrl: item.date,
                                                height: 50,
                                                width: 50,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: new BoxDecoration(
                                                    image: new DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "assets/images/placeholder.png"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              trailing: IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 30,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {}),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
