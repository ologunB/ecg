import 'dart:async';

import 'package:ecgalpha/models/investment.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/partials/each_order_item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OngoingOrders extends StatefulWidget {
  @override
  _ListViewNoteState createState() => _ListViewNoteState();
}

final pendingReference = FirebaseDatabase.instance
    .reference()
    .child("Transactions")
    .child("Pending")
    .child(MY_UID);

class _ListViewNoteState extends State<OngoingOrders>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<Investment> orders;
  StreamSubscription<Event> _onOrderAddedSubscription;

  @override
  void initState() {
    super.initState();
    orders = new List();
    _onOrderAddedSubscription =
        pendingReference.onChildAdded.listen(_onOrderAdded);
  }

  @override
  void dispose() {
    _onOrderAddedSubscription.cancel();
    super.dispose();
  }

  void _onOrderAdded(Event event) {
    setState(() {
      orders.add(new Investment.fromSnapshot(event.snapshot));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orders.length == 0
          ? CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: (context, index) {
                return EachOrderItem(
                  investment: orders[index],
                  color: Styles.appPrimaryColor,
                  type: "Pending",
                );
              },
              shrinkWrap: false,
              itemCount: orders.length,
            ),
    );
  }
}
