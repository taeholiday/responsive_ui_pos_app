import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String? buttonName;
  final Function? function;

  const ButtonComponent(
      {Key? key, required this.buttonName, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          function!(context);
        },
        child: Text(buttonName!));
  }
}
