import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shirt',
      amount: 100.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New sock',
      amount: 10.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Short',
      amount: 108.23,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
