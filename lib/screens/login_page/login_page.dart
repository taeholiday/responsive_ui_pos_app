// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/constants/validate_management/empty_validate.dart';
import 'package:test_responsive_ui/screens/sale_page/sale_page.dart';
import 'package:test_responsive_ui/shared_components/button_components/button_component.dart';
import 'package:test_responsive_ui/shared_components/button_components/text_button_component.dart';
import 'package:test_responsive_ui/shared_components/text_form_field_components/text_form_field_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("login")),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: formkey,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  return loginLayouttablet();
                } else {
                  return loginLayoutMobile();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget loginLayouttablet() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width > 800
            ? MediaQuery.of(context).size.width * 0.3
            : MediaQuery.of(context).size.width > 600
                ? MediaQuery.of(context).size.width * 0.5
                : MediaQuery.of(context).size.width * 0.9,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormFieldComponent(
            labelText: AppLocalizations.of(context)!.translate('emailLabel'),
            validatorCallBack: emptyValidator,
          ),
          TextFormFieldComponent(
            validatorCallBack: emptyValidator,
            labelText: AppLocalizations.of(context)!.translate('passwordLabel'),
            isPassword: true,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            height: 50.0,
            width: MediaQuery.of(context).size.width > 800
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.9,
            child: ButtonComponent(
              buttonName: AppLocalizations.of(context)!.translate("login"),
              function: callLoginService,
            ),
          ),
          TextButtonComponent(
            buttonName:
                AppLocalizations.of(context)!.translate("forgotPassword"),
            function: callForgetPasswordService,
          )
        ]),
      ),
    );
  }

  Widget loginLayoutMobile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormFieldComponent(
            labelText: AppLocalizations.of(context)!.translate('emailLabel'),
            validatorCallBack: emptyValidator,
          ),
          TextFormFieldComponent(
            validatorCallBack: emptyValidator,
            labelText: AppLocalizations.of(context)!.translate('passwordLabel'),
            isPassword: true,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            height: 50.0,
            width: MediaQuery.of(context).size.width > 800
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.9,
            child: ButtonComponent(
              buttonName: AppLocalizations.of(context)!.translate("login"),
              function: callLoginService,
            ),
          ),
          TextButtonComponent(
            buttonName:
                AppLocalizations.of(context)!.translate("forgotPassword"),
            function: callForgetPasswordService,
          )
        ],
      ),
    );
  }

  callForgetPasswordService() {
    log(time: DateTime.now(), "Call forget password service");
  }

  callLoginService(BuildContext context) {
    log(time: DateTime.now(), "Call login service");
    if (formkey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => const SalePage()),
          (route) => false);
    }
  }
}
