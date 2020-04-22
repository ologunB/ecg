import 'package:firebase_database/firebase_database.dart';

class Support {
  String _id;
  String _pop;
  String _date;
  String _title;
  String _desc;
  String _category;
  Support(
      this._id, this._pop, this._date, this._title, this._desc, this._category);

  String get pop => _pop;

  String get title => _title;

  String get desc => _desc;

  String get category => _category;
  String get date => _date;

  String get id => _id;

  Support.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _pop = snapshot.value['POP'];
    _date = snapshot.value['Date'];
    _title = snapshot.value['Title'];
    _desc = snapshot.value['Description'];
    _category = snapshot.value['Category'];
  }

  Support.map(dynamic obj) {
    this._id = obj["id"];
    this._pop = obj['POP'];
    this._date = obj['Date'];
    this._title = obj['Title'];
    this._desc = obj['Description'];
    this._date = obj['Date'];
  }
}