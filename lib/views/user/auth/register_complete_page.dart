import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/admin/admin_layout_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterCompleteScreen extends StatefulWidget {
  @override
  _RegisterCompleteScreenState createState() => _RegisterCompleteScreenState();
}

class _RegisterCompleteScreenState extends State<RegisterCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) => AdminLayoutTemplate()));
        },
        child: Container(
          padding: EdgeInsets.all(20),
          color: Styles.appPrimaryColor,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    "You are all set. You can now invest in us and get your cashback in days",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Center(
                  child: Text(
                    "TAP ANYWHERE TO CONTINUE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
