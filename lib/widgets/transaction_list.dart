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
        : ListView(children: [
            ...transactions
                .map((tx) => TransactionItem(
                      transaction: tx,
                      removeTransactionFromList: removeTransactionFromList,
                      itemIndex: tx.id,
                    ))
                .toList()
          ]);
  }
}
