import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_responsive_ui/provider/obscure_text_provider.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String? labelText;
  final bool? isPassword;
  final Function? validatorCallBack;
  final Map<String, dynamic> userInformation;
  final String keyString;
  const TextFormFieldComponent({
    Key? key,
    this.labelText,
    this.isPassword,
    this.validatorCallBack,
    required this.userInformation,
    required this.keyString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        userInformation[keyString] = value;
      },
      style: Theme.of(context).textTheme.bodyText1,
      obscureText: isPassword != null && isPassword!
          ? Provider.of<ObscureTextProvider>(context).getIsObscure
          : false,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyText1,
        suffixIcon: isPassword != null && isPassword!
            ? Consumer<ObscureTextProvider>(
                builder: (context, obscureTextProvider, child) => IconButton(
                  icon: Icon(
                      obscureTextProvider.getIsObscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey),
                  onPressed: () {
                    obscureTextProvider
                        .setObscureText(!obscureTextProvider.getIsObscure);
                  },
                ),
              )
            : null,
      ),
      validator: (value) =>
          validatorCallBack != null ? validatorCallBack!(context, value) : null,
    );
  }
}
