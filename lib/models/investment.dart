import 'package:firebase_database/firebase_database.dart';

class Investment {
  String _id;
  String _amount;
  String _date;
  String get date => _date;
  String get id => _id;
  String get amount => _amount;

  Investment(this._id, this._date, this._amount);

  Investment.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _amount = snapshot.value['Amount'];
    _date = snapshot.value['Date'];
  }

  Investment.map(dynamic obj) {
    this._id = obj["id"];
    this._amount = obj['Amount'];
    this._date = obj['Date'];
  }
}
