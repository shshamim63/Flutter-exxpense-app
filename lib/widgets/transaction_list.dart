import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './no_data.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransactionFromList;

  TransactionList(this.transactions, this.removeTransactionFromList);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? NoData()
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 4,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          '\$${transactions[index].amount}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () {
                      removeTransactionFromList(index);
                    },
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
