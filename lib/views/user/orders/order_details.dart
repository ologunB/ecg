import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/partials/custom_button.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Order Details",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/person.png",
                    ),
                    backgroundColor: Colors.grey[100],
                  ),
                ),
                Text("Mercedes e450",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Investment 1",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
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
                            fontWeight: FontWeight.w600,
                            color: Colors.black))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.directions_boat),
                          SizedBox(width: 10),
                          Text(
                            "ECG Admin",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.date_range),
                    SizedBox(width: 10),
                    Text("16th April 2020 (8:45)",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: Styles.appPrimaryColor))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Transaction Details",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Icon(Icons.directions_car,
                                  color: Styles.appCanvasColor),
                            ),
                          ),
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "₦10,000",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Interest (40/30) %",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "₦10,000",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Promo/Discount",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "₦ -",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Referral / Bonus",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "₦10,000",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(title: "CONFIRMED", onPress: () {}),
      ),
    );
  }
}
