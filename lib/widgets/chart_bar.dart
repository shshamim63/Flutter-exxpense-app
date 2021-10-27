import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingAmountInPercentage;

  ChartBar({
    required this.label,
    required this.spendingAmount,
    required this.spendingAmountInPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, contraints) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: contraints.maxHeight *0.15,
            child: FittedBox(
              child: Text(
                '\$${spendingAmount.toStringAsFixed(0)}',
              ),
            ),
          ),
          SizedBox(
            height: contraints.maxHeight *0.05,
          ),
          SizedBox(
            height: contraints.maxHeight *0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingAmountInPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: contraints.maxHeight *0.05,
          ),
          SizedBox(
            height: contraints.maxHeight *0.15,
            child: Text(
              label,
            ),
          ),
        ],
      );
    });
  }
}
