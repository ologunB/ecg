import 'package:ecgalpha/utils/toast.dart';
import 'package:flutter/cupertino.dart';

class Constants {
  static bool testing = false;

  /// e.t.c.
  static double commonPadding = 15.0;
  static String commonDateFormat = "dd MMM yyyy, hh:mm a";

  /// storage keys
  static String accessTokenKey = "token";
  static String userNameKey = "name";
  static String userFullNameKey = "full_name";
  static String userAkaKey = "aka";
  static String userEmailKey = "email";
  static String shortLoremText =
      "Lorem ipsum dolor sit amet, mod tempor incididunt ut labore et dolore magna aliqua.  ";
  static String longLoremText =
      "Lorem ipsum dolor sit amet,  tempor incididu gna aliqua. Ut enim ad minim veniam, quis nostrud exercitation";
  static List<String> userType = ["Car Owner", "Service Station"];
}

showToast(String msg, BuildContext context) {
  Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
}
