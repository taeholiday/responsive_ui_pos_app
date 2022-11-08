// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:test_responsive_ui/screens/login_page/login_page_mobile_layout.dart';
import 'package:test_responsive_ui/screens/login_page/login_page_tablet_layout.dart';
import 'package:test_responsive_ui/screens/sale_page/sale_page.dart';
import 'package:test_responsive_ui/shared_components/responsive/responsive_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  Map<String, dynamic> userInformation = {"email": "", "password": ""};

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: LoginPageMobileLayout(
          callLoginService: callLoginService,
          callForgetPasswordService: callForgetPasswordService,
          formKey: formkey,
          userInformation: userInformation,
        ),
        tabletBody: LoginPageTabletLayout(
          callLoginService: callLoginService,
          callForgetPasswordService: callForgetPasswordService,
          formKey: formkey,
          userInformation: userInformation,
        ));
  }

  callForgetPasswordService() {
    log(time: DateTime.now(), "Call forget password service");
  }

  callLoginService(BuildContext context) {
    log(time: DateTime.now(), "Call login service");
    if (formkey.currentState!.validate()) {
      print("userInformation Login");
      print(userInformation);
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => const SalePage()),
          (route) => false);
    }
  }
}
