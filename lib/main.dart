import 'package:ecgalpha/utils/constants.dart';
import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/user/auth/auth_page.dart';
import 'package:ecgalpha/views/user/partials/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Styles.appPrimaryColor,
      ),
      home: MyWrapper(),
    );
  }
}

class MyWrapper extends StatefulWidget {
  @override
  _MyWrapperState createState() => _MyWrapperState();
}

class _MyWrapperState extends State<MyWrapper> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> isLoggedIn;
  Future<String> remememail, remempass;

  @override
  void initState() {
    super.initState();

    isLoggedIn = _prefs.then((prefs) {
      return (prefs.getBool('isLoggedIn') ?? false);
    });
    remememail = _prefs.then((prefs) {
      return (prefs.getString('REMEMBER_EMAIL') ?? false);
    });
    remempass = _prefs.then((prefs) {
      return (prefs.getString('REMEMBER_pass') ?? false);
    });

    doAssign();
  }

  void doAssign() async {
    REMEMBER_EMAIL = await remememail;
    REMEMBER_PASS = await remempass;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: isLoggedIn,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool loggedIn = snapshot.data;
            if (loggedIn) {
              return LayoutTemplate(pageSelectedIndex: 0);
            } else {
              return AuthPage();
            }
          }
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  /*    image: DecorationImage(
                image: AssetImage(
                      "assets/images/app_back.jpg",
                    ),
                    fit: BoxFit.fill),*/
                  ),
            ),
          );
        });
  }
}
