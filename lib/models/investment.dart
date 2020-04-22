import 'package:firebase_database/firebase_database.dart';

class Investment {
  String _id;
  String _amount;
  String _date;

  Investment(this._id, this._date, this._amount);

  String get date => _date;

  String get id => _id;
  String get amount => _amount;

  Investment.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _amount = snapshot.value['Amount'];
    _date = snapshot.value['Date'];
  }
}
