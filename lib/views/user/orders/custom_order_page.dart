import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/models/investment.dart';
import 'package:ecgalpha/views/partials/custom_button.dart';
import 'package:ecgalpha/views/partials/each_order_item.dart';
import 'package:ecgalpha/views/user/partials/create_investment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOrderPage extends StatefulWidget {
  final String type;
  final Color color;
  final String theUID;

  const CustomOrderPage({Key key, this.type, this.color, this.theUID})
      : super(key: key);
  @override
  _ListViewNoteState createState() => _ListViewNoteState();
}

class _ListViewNoteState extends State<CustomOrderPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("Transactions")
          .document(widget.type)
          .collection(widget.theUID)
          .orderBy("Timestamp")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //  Image.asset("assets/images/confirmed.png"),
                        // SizedBox(height: 30),
                        Text(
                          "No transactions yet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                        SizedBox(height: 30),
                        CustomButton(
                          title: "Make an Investment",
                          onPress: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => CreateInvestment()));
                          },
                        )
                      ],
                    ),
                  )
                : ListView(
                    children: snapshot.data.documents.map((document) {
                      return EachOrderItem(
                        investment: Investment.map(document),
                        color: widget.color,
                        type: widget.type,
                      );
                    }).toList(),
                  );
        }
      },
    );
  }
}
