import 'package:ecgalpha/utils/styles.dart';
import 'package:ecgalpha/views/partials/custom_button.dart';
import 'package:ecgalpha/views/user/auth/register_complete_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String text1 = "Welcome! ";
  String text2 = "Login to continue ";
  String text3 = "Hello! ";
  String text4 = "Signup in a minute ";

  bool isLogin = true;
  Widget presentWidget = LoginWidget();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Styles.appPrimaryColor,
                      Colors.blue,
                      Styles.appAccentColor,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                ),
                //   color: Styles.appPrimaryColor,
                height: size.height / 2.5,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GoogleSignInButton(
                      onPressed: () {},
                      text: "SIGN IN WITH GOOGLE",
                      darkMode: true,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
              height: size.height,
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    isLogin ? text1 : text3,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    isLogin ? text2 : text4,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey[200], blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        if (presentWidget != LoginWidget()) {
                                          setState(() {
                                            presentWidget = LoginWidget();
                                            isLogin = true;
                                          });
                                        }
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Login",
                                            style: TextStyle(
                                                color: isLogin
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                fontSize: 22),
                                          ),
                                          isLogin
                                              ? Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  width: 80,
                                                  child: Divider(
                                                    thickness: 3,
                                                    height: 10.0,
                                                    color: Colors.blue,
                                                  ),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    InkWell(
                                      onTap: () {
                                        if (presentWidget != SignupWidget()) {
                                          setState(() {
                                            presentWidget = SignupWidget();
                                            isLogin = false;
                                          });
                                        }
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Signup",
                                            style: TextStyle(
                                                color: isLogin
                                                    ? Colors.grey
                                                    : Colors.blue,
                                                fontSize: 22),
                                          ),
                                          isLogin
                                              ? Container()
                                              : Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  width: 80,
                                                  child: Divider(
                                                    thickness: 3,
                                                    height: 10.0,
                                                    color: Colors.blue,
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              isLogin ? SizedBox(height: 70) : Container(),
                              presentWidget,
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomButton(
                                    title: isLogin ? "LOGIN" : "SIGNUP",
                                    onPress: () {
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  RegisterCompleteScreen()));
                                    }),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.grey, hintColor: Colors.grey),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.mail, color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.grey, hintColor: Colors.grey),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.vpn_key, color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Checkbox(
                value: true,
                onChanged: (newValue) {
                  setState(() {
                    // checkedValue = newValue;
                  });
                },
                activeColor: Colors.deepOrange,
                checkColor: Colors.white,
              ),
              Text("Remember me",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}

class SignupWidget extends StatefulWidget {
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.grey, hintColor: Colors.grey),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.grey, hintColor: Colors.grey),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.mail, color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.grey, hintColor: Colors.grey),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.vpn_key, color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //  mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "By signing up you agree to our ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms and Condition',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Styles.appPrimaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            }),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Styles.appPrimaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            }),
                    ]),
              )
            ],
          ),
        )
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }
}
