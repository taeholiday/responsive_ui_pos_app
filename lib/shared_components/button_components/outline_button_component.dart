import 'package:flutter/material.dart';

class OutlineButtonComponent extends StatelessWidget {
  final String? buttonName;
  final Function? function;
  const OutlineButtonComponent(
      {Key? key, required this.buttonName, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        function!(context);
      },
      child: Text(buttonName!),
    );
  }
}
