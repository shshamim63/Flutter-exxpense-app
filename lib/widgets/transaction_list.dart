import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purpleAccent,
                    width: 2,
                  ),
                ),
                child: Text(
                  '\$${transaction.amount}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transaction.date),
                    style: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
