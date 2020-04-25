import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/models/investment.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/views/admin/orders/each_order_item.dart';
import 'package:ecgalpha/views/admin/payout/pending_payout_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPayoutPage extends StatefulWidget {
  final String type;
  final Color color;

  const CustomPayoutPage({
    Key key,
    @required this.type,
    @required this.color,
  }) : super(key: key);
  @override
  _ListViewNoteState createState() => _ListViewNoteState();
}

class _ListViewNoteState extends State<CustomPayoutPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String selectedDate = next7Date();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DropdownButton<String>(
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("Select the date you sent to process"),
        ),
        value: selectedDate,
        underline: SizedBox(),
        items: date7List().map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    value,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            selectedDate = value;
          });
        },
      ),
      Divider(),
      Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection("Admin")
              .document(selectedDate)
              .collection("Transactions")
              .document(widget.type)
              .collection(MY_UID)
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
                          ],
                        ),
                      )
                    : ListView(
                        children: snapshot.data.documents.map((document) {
                          return widget.type == "Confirmed"
                              ? PendingPayoutItem(
                                  investment: Investment.map(document),
                                  color: widget.color,
                                  type: widget.type)
                              : EachOrderItem(
                                  investment: Investment.map(document),
                                  color: widget.color,
                                  type: widget.type,
                                );
                        }).toList(),
                      );
            }
          },
        ),
      )
    ]);
  }
}
