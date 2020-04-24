import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/models/investment.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/admin/orders/order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingOrderItem extends StatefulWidget {
  final Investment investment;
  final Color color;
  final String type;

  const PendingOrderItem(
      {Key key,
      @required this.investment,
      @required this.color,
      @required this.type})
      : super(key: key);

  @override
  _PendingOrderItemState createState() => _PendingOrderItemState();
}

class _PendingOrderItemState extends State<PendingOrderItem> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.color;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => OrderDetails(
                      investment: widget.investment,
                      color: color,
                      type: widget.type,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      widget.investment.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
                Icon(
                  Icons.payment,
                  color: color,
                ),
                SizedBox(width: 10),
                Text(
                  "₦${commaFormat.format(double.parse(widget.investment.amount))}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Divider(),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (_) {
                              return StatefulBuilder(
                                builder: (context, _setState) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                    ),
                                    child: AlertDialog(
                                      title: Center(
                                        child: Text(
                                          isLoading
                                              ? "Processing"
                                              : "Do you want to cancel the order?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: Container(
                                        child: isLoading
                                            ? Container(
                                                alignment: Alignment.center,
                                                height: 100,
                                                width: 100,
                                                child:
                                                    CircularProgressIndicator())
                                            : Container(),
                                      ),
                                      actions: <Widget>[
                                        InkWell(
                                          onTap: isLoading
                                              ? null
                                              : () {
                                                  Navigator.pop(context);
                                                },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              isLoading ? "" : "CANCEL",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: isLoading
                                              ? null
                                              : () {
                                                  processOrder(
                                                      widget.investment,
                                                      _setState,
                                                      "Cancelled");
                                                },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              isLoading ? "" : "YES",
                                              style: TextStyle(
                                                  color: Styles.appPrimaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "CANCEL",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Styles.appPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (_) {
                              return StatefulBuilder(
                                builder: (context, _setState) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                    ),
                                    child: AlertDialog(
                                      title: Center(
                                        child: Text(
                                          isLoading
                                              ? "Processing"
                                              : "Do you want to confirm the order?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: Container(
                                        child: isLoading
                                            ? Container(
                                                alignment: Alignment.center,
                                                height: 100,
                                                width: 100,
                                                child:
                                                    CircularProgressIndicator())
                                            : Container(),
                                      ),
                                      actions: <Widget>[
                                        InkWell(
                                          onTap: isLoading
                                              ? null
                                              : () {
                                                  Navigator.pop(context);
                                                },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              isLoading ? "" : "CANCEL",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: isLoading
                                              ? null
                                              : () {
                                                  processOrder(
                                                      widget.investment,
                                                      _setState,
                                                      "Confirmed");
                                                },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              isLoading ? "" : "YES",
                                              style: TextStyle(
                                                  color: Styles.appPrimaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "CONFIRM",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 4,
                thickness: 6,
              ),
            )
          ],
        ),
      ),
    );
  }

  void processOrder(Investment item, _setState, String type) {
    Map<String, Object> mData = Map();
    mData.putIfAbsent("Name", () => item.name);
    mData.putIfAbsent("Date", () => item.date);
    mData.putIfAbsent("Amount", () => item.amount);
    mData.putIfAbsent("To Account ", () => MY_UID);
    mData.putIfAbsent("Uid", () => MY_UID);
    mData.putIfAbsent("Timestamp", () => DateTime.now().millisecondsSinceEpoch);
    mData.putIfAbsent("id", () => item.id);
    mData.putIfAbsent("Confirmed By", () => MY_NAME);

    _setState(() {
      isLoading = true;
    });

    Firestore.instance
        .collection("Admin")
        .document(item.date)
        .collection("Transactions")
        .document("Pending")
        .collection(MY_UID)
        .document(item.id)
        .setData(mData)
        .then((a) {
      Firestore.instance
          .collection("Transactions")
          .document("Pending")
          .collection(MY_UID)
          .document(item.id)
          .setData(mData)
          .then((a) {
        Firestore.instance
            .collection("Admin")
            .document(item.date)
            .collection("Transactions")
            .document(type)
            .collection(MY_UID)
            .document(item.id)
            .delete();
        Firestore.instance
            .collection("Transactions")
            .document(type)
            .collection(MY_UID)
            .document(item.id)
            .delete();

        _setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
        showToast("Order has been $type", context);
      });
    });
  }

  bool isLoading = false;
}
