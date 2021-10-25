import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'No data availabe, Please add transaction',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: 200,
          child: Image.asset(
            'assets/images/nodata-found.png',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
