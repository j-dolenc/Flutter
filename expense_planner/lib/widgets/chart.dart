import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTs;

  Chart(this.recentTs);

  List<Map<String, Object>> get groupedTsValues {
    return List.generate(7, (index) {
      //index goes 1..7
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (Transaction i in recentTs) {
        if (i.date.day == weekDay.day &&
            i.date.month == weekDay.month &&
            i.date.year == weekDay.year) totalSum += i.amount;
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTsValues);
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: [],
        ));
  }
}
