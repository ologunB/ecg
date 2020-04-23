import 'package:firebase_database/firebase_database.dart';

class Investment {
  String _id;
  String _amount;
  String _date;
  int _timeStamp;

  String get date => _date;
  String get id => _id;
  String get amount => _amount;
  int get timeStamp => _timeStamp;

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
    this._timeStamp = obj['Timestamp'];
  }
}
