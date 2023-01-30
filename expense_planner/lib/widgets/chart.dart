import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

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
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get fullSpending {
    return groupedTsValues.fold(0.0, (previousValue, element) {
      return previousValue += (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTsValues);
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTsValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['day'],
                  spendingAmount: data['amount'],
                  spendingPercent: fullSpending == 0.0
                      ? 0
                      : (data['amount'] as double) / fullSpending,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
