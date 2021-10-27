import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline3: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];
  bool _showChart = false;

  void _updateShowChartStatus(val) {
    setState(() {
      _showChart = val;
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((uTx) {
      return uTx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: txDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _removeTransaction(int index) {
    setState(() {
      _userTransactions.removeAt(index);
    });
  }

  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: Colors.black,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandScapeMode =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Personal Expense'),
      actions: <Widget>[
        IconButton(
          onPressed: () => _showAddNewTransaction(context),
          icon: const Icon(
            Icons.add,
            color: Colors.lime,
          ),
        ),
      ],
    );

    final txListWidget = SizedBox(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.6,
      child: TransactionList(_userTransactions, _removeTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandScapeMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Show Chart',
                  ),
                  Switch(
                    value: _showChart,
                    onChanged: (val) => _updateShowChartStatus(val),
                  ),
                ],
              ),
            if (!isLandScapeMode)
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions),
              ),
            if (!isLandScapeMode) txListWidget,
            if (isLandScapeMode)
              _showChart
                  ? SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.6,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidget,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => _showAddNewTransaction(context),
      ),
    );
  }
}
