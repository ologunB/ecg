import 'dart:io';
import 'dart:math';

import 'package:ecgalpha/utils/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Constants {
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
    MY_IMAGE,
    REMEMBER_PASS,
    REMEMBER_EMAIL;

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
  return DateFormat("EEE MMM d HH:mm").format(DateTime.now());
}

// return DateFormat("EEE MMM d, yyyy HH:mm a").format(DateTime.now());

final commaFormat = new NumberFormat("#,##0", "en_US");

Future<String> uploadImage(File file) async {
  String url = "";
  if (file != null) {
    StorageReference reference =
        FirebaseStorage.instance.ref().child("images/${randomString()}");

    StorageUploadTask uploadTask = reference.putFile(file);
    StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    url = (await downloadUrl.ref.getDownloadURL());
  }
  return url;
}

List<String> supportCategories = [
  "Non Payment of confirmed funds",
  "Cancelled Orders",
  "Problem with Confirmation",
  "App lags or gives inaccurate data",
  "Mistake in transaction",
  "Others"
];
