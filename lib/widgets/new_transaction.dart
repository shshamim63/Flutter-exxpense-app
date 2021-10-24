import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            TextField(
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
