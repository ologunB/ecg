import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/user/auth/auth_page.dart';
import 'package:ecgalpha/views/user/partials/create_investment.dart';
import 'package:ecgalpha/views/user/profile/change_password.dart';
import 'package:ecgalpha/views/user/profile/update_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
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
              Text("Richard Fredrick",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text("fichardfredrick@yahoo.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => UpdateBankDetails(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit, color: Colors.deepPurple),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Update Bank Details",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.star, color: Colors.yellow),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Rate our App",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.help, color: Colors.blue),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Help and Support",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ChangePasswordPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.fingerprint, color: Colors.green),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: AlertDialog(
                            title: Center(
                              child: Text(
                                "Confirmation!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            content: Container(
                              child: Text(
                                "Are you sure you want to logout?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "CANCEL",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Future<SharedPreferences> _prefs =
                                      SharedPreferences.getInstance();

                                  final SharedPreferences prefs = await _prefs;

                                  setState(() {
                                    prefs.setBool("isLoggedIn", false);
                                    prefs.remove("type");
                                    prefs.remove("uid");
                                    prefs.remove("email");
                                    prefs.remove("name");
                                  });
                                  FirebaseAuth.instance.signOut();

                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AuthPage(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "CONFIRM",
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
                      });
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.reply, color: Colors.red),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Log Out",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.appPrimaryColor,
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => CreateInvestment()));
        },
        child: Icon(Icons.add, size: 30),
      ),
    ));
  }
}
