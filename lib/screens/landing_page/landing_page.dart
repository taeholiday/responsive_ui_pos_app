import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/screens/landing_page/landing_page_mobile_layout.dart';
import 'package:test_responsive_ui/screens/landing_page/landing_page_tablet_layout.dart';
import 'package:test_responsive_ui/screens/login_page/login_page.dart';
import 'package:test_responsive_ui/screens/register_page/register_page.dart';
import 'package:test_responsive_ui/shared_components/responsive/responsive_layout.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: LandingPagemobileLayout(
            callLoginPage: callLoginPage, callRegisterPage: callRegisterPage),
        tabletBody: LandingPageTabletLayout(
            callLoginPage: callLoginPage, callRegisterPage: callRegisterPage));
  }

  void callRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => const RegisterPage()),
    );
  }

  void callLoginPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginPage()),
    );
  }
}
