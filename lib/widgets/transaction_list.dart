import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './no_data.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? NoData()
          : ListView.builder(
              itemBuilder: (ctx, index) {
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
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
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
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
