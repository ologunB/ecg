import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/user/partials/order_confirmed_done.dart';
import 'package:ecgalpha/views/user/profile/change_password.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../partials/custom_button.dart';

class CreateInvestment extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class Account {
  String name, number, bank;
  Account(this.name, this.number, this.bank);
}

List accounts = [
  Account("Ologun Richard", "0209339392", "GTBank"),
  Account("Adebayo Richard", "0203439392", "First Bank")
];

class _PaymentMethodState extends State<CreateInvestment> {
  File pop;
  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pop = img;
    });
  }

  TextEditingController name = TextEditingController(text: MY_NAME);
  TextEditingController date = TextEditingController(text: thePresentTime());
  TextEditingController amount = TextEditingController();

  bool isLoading = false;
  bool checkedValue = false;
  Account selectedAccount;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Create New Investment",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("Name"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter here"),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            controller: name,
                          ),
                        ),
                        Divider(),
                        text("Date"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter here"),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            enabled: false,
                            controller: date,
                          ),
                        ),
                        Divider(),
                        text("Amount"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixText: "₦",
                                prefixStyle: TextStyle(fontSize: 22),
                                border: InputBorder.none,
                                hintText: "Enter here"),
                            onChanged: (a) {},
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            controller: amount,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(),
                        text("Choose Account"),
                        DropdownButton<Account>(
                          hint: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("Select the account you sent to"),
                          ),
                          value: selectedAccount,
                          underline: SizedBox(),
                          items: accounts.map((value) {
                            return DropdownMenuItem<Account>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          value.name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Text(value.number),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(value.bank)
                                          ],
                                        )
                                      ],
                                      mainAxisSize: MainAxisSize.min,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              selectedAccount = value;
                            });
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        Divider(),
                        text("Proof of Payment"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              getImage();
                            },
                            child: pop == null
                                ? Container(
                                    height: 100,
                                    color: Colors.blueAccent[100],
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.add),
                                          Text("Add Image")
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(pop,
                                        height: 100, fit: BoxFit.contain),
                                  ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: checkedValue,
                                onChanged: (val) {
                                  setState(() {
                                    checkedValue = val;
                                  });
                                }),
                            Flexible(
                              child: Text(
                                "I uploaded proof of payment",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
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
          )
        ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: CustomButton(
              title: "Confirm Order",
              onPress: () {
                if (!checkedValue || pop == null) {
                  showToast("Upload a Proof of Payment!", context);
                  // return;
                }
                if (amount.text.isEmpty || selectedAccount == null) {
                  showToast("Fill all values!", context);
                  return;
                }
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
                                      : "Are you sure you have fulfilled this investment?",
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
                                        child: CircularProgressIndicator())
                                    : Text(
                                        "Make sure you have sent the investment to the given account number",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
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
                                          confirmPayment(_setState);
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
              }),
        ),
      ),
    );
  }

  void confirmPayment(_setState) async {
    String rnd = "INV" + DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, Object> mData = Map();
    mData.putIfAbsent("Name", () => MY_NAME);
    mData.putIfAbsent("Date", () => thePresentTime());
    mData.putIfAbsent("Amount", () => amount.text);
    String t = selectedAccount.name + "  " + selectedAccount.bank;
    mData.putIfAbsent("Account Paid", () => t);
    mData.putIfAbsent("Uid", () => MY_UID);
    mData.putIfAbsent("Timestamp", () => DateTime.now().millisecondsSinceEpoch);
    mData.putIfAbsent("id", () => rnd);

    // if (pop != null) {
    if (true) {
      _setState(() {
        isLoading = true;
      });

      /*StorageReference storeRef = _storageRef.child("images/${randomString()}");
      StorageUploadTask uploadTask = storeRef.putFile(pop);
      StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      String url = (await downloadUrl.ref.getDownloadURL());
      mData.putIfAbsent("POP", () => url);
*/

      Firestore.instance
          .collection("Admin")
          .document(thePresentTime())
          .collection("Transactions")
          .document("Confirmed")
          .collection(MY_UID)
          .document(rnd)
          .setData(mData);

      Firestore.instance
          .collection("Transactions")
          .document("Confirmed")
          .collection(MY_UID)
          .document(rnd)
          .setData(mData)
          .then((val) {
        _setState(() {
          isLoading = true;
        });
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) => OrderConfirmedDone(),
                fullscreenDialog: true));
      }).catchError((e) {
        _setState(() {
          isLoading = false;
        });
      });
    }
  }
}

var rootRef = FirebaseDatabase.instance.reference();
var _storageRef = FirebaseStorage.instance.ref();
