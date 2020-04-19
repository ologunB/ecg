import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../each_order_item.dart';
import 'order_details.dart';

class ConfirmedOrders extends StatefulWidget {
  @override
  _ConfirmedOrdersState createState() => _ConfirmedOrdersState();
}

class _ConfirmedOrdersState extends State<ConfirmedOrders> {
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
            child: EachOrderItem(),
          );
        },
        shrinkWrap: true,
        itemCount: 2,
      ),
    );
  }
}
