import 'package:ecgalpha/utils/styles.dart';
import 'package:flutter/material.dart';

import 'cancelled/cancelled_order.dart';
import 'confirmed/confirmed_order.dart';
import 'ongoing/ongoing_order.dart';

class OrdersView extends StatefulWidget {
  OrdersView({Key key}) : super(key: key);

  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.white,
          elevation: 1.0,
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.grey[500],
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Styles.appPrimaryColor),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Pending",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Confirmed",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Cancelled",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]),
          title: Text(
            "My Orders",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: TabBarView(children: [
            OngoingOrders(),
            ConfirmedOrders(),
            CancelledOrders()
          ]),
        ),
      ),
    );
  }
}
