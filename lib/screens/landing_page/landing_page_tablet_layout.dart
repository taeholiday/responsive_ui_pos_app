import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/shared_components/button_components/outline_button_component.dart';

import '../../shared_components/button_components/button_component.dart';

class LandingPageTabletLayout extends StatelessWidget {
  final Function callLoginPage;
  final Function callRegisterPage;
  const LandingPageTabletLayout(
      {super.key, required this.callLoginPage, required this.callRegisterPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Text(AppLocalizations.of(context)!.translate("title"),
                            style: Theme.of(context).textTheme.headline4),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 50.0,
                          child: ButtonComponent(
                              buttonName: AppLocalizations.of(context)!
                                  .translate("register")
                                  .toUpperCase(),
                              function: callRegisterPage)),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 50.0,
                        child: OutlineButtonComponent(
                          buttonName: AppLocalizations.of(context)!
                              .translate("login")
                              .toUpperCase(),
                          function: callLoginPage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
