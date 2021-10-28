import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: constraints.maxHeight * 0.3,
            child: Text(
              'No data availabe, Please add transaction',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.65,
            width: constraints.maxWidth * 0.7,
            child: Image.asset(
              'assets/images/nodata-found.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    });
  }
}
