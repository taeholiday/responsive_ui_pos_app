import 'package:flutter/material.dart';

class TextButtonComponent extends StatelessWidget {
  final String? buttonName;
  final Function? function;

  const TextButtonComponent({
    Key? key,
    this.buttonName,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function!();
      },
      child: Text(buttonName!),
    );
  }
}
