import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './no_data.dart';
import './transaction_item.dart';

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
              return TransactionItem(
                transaction: transactions[index],
                removeTransactionFromList: removeTransactionFromList,
                itemIndex: index,
              );
            },
            itemCount: transactions.length,
          );
  }
}
