import 'package:flutter/material.dart';

class PaymentModel {
  IconData _icon;
  String _name, _date, _hour;
  Color _color;
  double _amount;
  int _paymentType;

  PaymentModel(this._icon, this._color, this._name, this._date, this._hour,
      this._amount, this._paymentType);

  String get name => _name;

  String get date => _date;

  String get hour => _hour;

  double get amount => _amount;

  int get type => _paymentType;

  IconData get icon => _icon;

  Color get color => _color;
}
