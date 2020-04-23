class Investment {
  String _id;
  String _amount;
  String _date;
  String _confirmedBy;
  int _timeStamp;

  String get date => _date;
  String get confirmedBy => _confirmedBy;
  String get id => _id;
  String get amount => _amount;
  int get timeStamp => _timeStamp;

  Investment(
      this._id, this._date, this._amount, this._timeStamp, this._confirmedBy);

  Investment.map(dynamic obj) {
    this._id = obj["id"];
    this._amount = obj['Amount'];
    this._date = obj['Date'];
    this._confirmedBy = obj['Confirmed By'];
    this._timeStamp = obj['Timestamp'];
  }
}
