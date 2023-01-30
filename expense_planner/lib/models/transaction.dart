import 'package:flutter/foundation.dart';

class Transaction {
  //we want to use this as an object not a widget
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
