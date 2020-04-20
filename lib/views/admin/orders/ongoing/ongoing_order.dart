import 'package:ecgalpha/views/user/orders/confirmed/order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OngoingOrders extends StatefulWidget {
  @override
  _OngoingOrdersState createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {
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
                        color: Colors.blue,
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
                      Icon(
                        Icons.label,
                        color: Colors.blue,
                      ),
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
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.date_range,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10),
                            Text("16th April 2020 (8:45PM)",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent[100].withAlpha(111),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Ongoing",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
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
        shrinkWrap: false,
        itemCount: 1,
      ),
    );
  }
}
