import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveElevatedButton extends StatelessWidget {
  final String labelText;
  final VoidCallback _handlerFunction;

  AdaptiveElevatedButton(this.labelText, this._handlerFunction);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              labelText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onPressed: _handlerFunction,
          )
        : ElevatedButton(
            onPressed: _handlerFunction,
            child: Text(
              labelText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          );
  }
}
