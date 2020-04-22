import 'dart:math';

import 'package:ecgalpha/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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

// ignore: non_constant_identifier_names
String MY_NAME,
    MY_UID,
    MY_EMAIL,
    MY_BANK_ACCOUNT_NAME,
    MY_ACCOUNT_NUMBER,
    MY_BANK_NAME,
    MY_IMAGE;

showToast(String msg, BuildContext context) {
  Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
}

const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

String randomString() {
  Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < 12; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

String thePresentTime() {
  return DateFormat("MMM d, yyyy HH:mm a").format(DateTime.now());
}

final oCcy = new NumberFormat("#,##0", "en_US");
