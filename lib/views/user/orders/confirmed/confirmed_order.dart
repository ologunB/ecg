import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order_details.dart';

class ConfirmedOrders extends StatefulWidget {
  @override
  _ConfirmedOrdersState createState() => _ConfirmedOrdersState();
}

class _ConfirmedOrdersState extends State<ConfirmedOrders>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => OrderDetails()));
            },
            child: Text("ere"),
          );
        },
        shrinkWrap: true,
        itemCount: 2,
      ),
    );
  }
}
