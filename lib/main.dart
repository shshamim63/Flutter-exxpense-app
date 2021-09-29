import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart!'),
              color: Colors.blue,
            ),
          ),
          Card(
            child: Text('LIST OF TX'),
          ),
        ],
      ),
    );
  }
}