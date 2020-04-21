import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/toast.dart';
import 'package:ecgalpha/views/partials/custom_loading_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'change_password.dart';

class UpdateBankDetails extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<UpdateBankDetails> {
  TextEditingController bankName =
      TextEditingController(text: MY_BANK_NAME.trim());
  TextEditingController bankNumber =
      TextEditingController(text: MY_ACCOUNT_NUMBER.trim());
  TextEditingController accName =
      TextEditingController(text: MY_BANK_ACCOUNT_NAME.trim());

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Update Bank Details",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(children: [
          Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Enter your details correctly",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("Account Name"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter here"),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your name!';
                                }
                                return null;
                              },
                              controller: accName,
                            ),
                          ),
                          Divider(),
                          text("Account Number"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter here"),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Number!';
                                } else if (value.length != 10) {
                                  return 'Number must be equal to 10';
                                }
                                return null;
                              },
                              controller: bankNumber,
                            ),
                          ),
                          Divider(),
                          text("Bank Name"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter here"),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your Bank Name!';
                                }
                                return null;
                              },
                              controller: bankName,
                            ),
                          ),
                          Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Checkbox(value: true, onChanged: (val) {}),
                              Flexible(
                                child: Text(
                                  "Receive payment through account",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 22, color: Colors.grey[300])
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomLoadingButton(
            title: isLoading ? "" : "Update",
            onPress: isLoading
                ? null
                : () async {
                    _formKey.currentState.save();
                    _formKey.currentState.validate();

                    setState(() {
                      _autoValidate = true;
                    });

                    if (_formKey.currentState.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      final Map<String, Object> m = Map();
                      m.putIfAbsent("Account Name", () => accName.text);
                      m.putIfAbsent("Bank Number", () => bankNumber.text);
                      m.putIfAbsent("Bank Name", () => bankName.text);

                      final SharedPreferences prefs = await _prefs;

                      await rootRef
                          .child("User Collection")
                          .child(MY_UID)
                          .update(m)
                          .whenComplete(() => () {
                                setState(() {
                                  isLoading = false;

                                  prefs.setString("Bank Name", bankName.text);
                                  prefs.setString(
                                      "Account Number", bankNumber.text);
                                  prefs.setString("Account Name", accName.text);
                                });
                                Toast.show("Updated!", context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.CENTER);
                              });
                    }
                  },
            icon: isLoading
                ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
            iconLeft: false,
          ),
        ),
      ),
    );
  }
}

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
var rootRef = FirebaseDatabase.instance.reference();
