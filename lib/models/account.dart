class Account {
  String _name, _number, _bank, _id;
  String get name => _name;
  String get number => _number;
  String get id => _id;
  String get bank => _bank;
  Account(this._name, this._number, this._bank, this._id);

  Account.map(dynamic obj) {
    this._id = obj["Uid"];
    this._name = obj['Account Name'];
    this._bank = obj['Bank Name'];
    this._number = obj['Bank Number'];
  }
}
