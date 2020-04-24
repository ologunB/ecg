class Investment {
  String _id;
  String _uid;
  String _amount;
  String _name;
  String _date;
  String _confirmedBy;
  int _timeStamp;

  String get name => _name;
  String get date => _date;
  String get confirmedBy => _confirmedBy;
  String get id => _id;
  String get uid => _uid;
  String get amount => _amount;
  int get timeStamp => _timeStamp;

  Investment(this._id, this._date, this._amount, this._timeStamp,
      this._confirmedBy, this._name, this._uid);

  Investment.map(dynamic obj) {
    this._name = obj["Name"];
    this._id = obj["id"];
    this._uid = obj["Uid"];
    this._amount = obj['Amount'];
    this._date = obj['Date'];
    this._confirmedBy = obj['Confirmed By'];
    this._timeStamp = obj['Timestamp'];
  }
}
