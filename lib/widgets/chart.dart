import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, dynamic>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var amountSumForADay = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          amountSumForADay += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': amountSumForADay
      };
    });
  }

  double get totalSpendOfTheWeek {
    return groupTransactionValues.fold(0.0, (previousValue, item) {
      return previousValue += item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: groupTransactionValues.map((gTx) {
            return Expanded(
              child: ChartBar(
                  label: gTx['day'] as String,
                  spendingAmount: gTx['amount'],
                  spendingAmountInPercentage: totalSpendOfTheWeek == 0.0
                      ? 0.0
                      : (gTx['amount']) / totalSpendOfTheWeek),
            );
          }).toList(),
        ),
      ),
    );
  }
}
