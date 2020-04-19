import 'package:ecgalpha/views/user/orders/confirmed/order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelledOrders extends StatefulWidget {
  @override
  _CancelledOrdersState createState() => _CancelledOrdersState();
}

class _CancelledOrdersState extends State<CancelledOrders> {
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
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "General Servicing",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                      )),
                      Icon(
                        Icons.payment,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10),
                      Text("₦5000",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.black))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.label, color: Colors.red),
                      SizedBox(width: 10),
                      Text("ECG Admin",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.date_range, color: Colors.red),
                      SizedBox(width: 10),
                      Text("Cancelled",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.red))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Divider(),
                  )
                ],
              ),
            ),
          );
        },
        shrinkWrap: true,
        itemCount: 1,
      ),
    );
  }
}
