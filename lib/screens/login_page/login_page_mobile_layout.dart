import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/constants/validate_management/empty_validate.dart';
import 'package:test_responsive_ui/shared_components/button_components/button_component.dart';
import 'package:test_responsive_ui/shared_components/button_components/text_button_component.dart';
import 'package:test_responsive_ui/shared_components/text_form_field_components/text_form_field_component.dart';

class LoginPageMobileLayout extends StatelessWidget {
  final Function callLoginService;
  final Function callForgetPasswordService;
  final formKey;
  final Map<String, dynamic> userInformation;
  const LoginPageMobileLayout({
    super.key,
    required this.callLoginService,
    required this.callForgetPasswordService,
    required this.formKey,
    required this.userInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate("login"),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormFieldComponent(
                    labelText:
                        AppLocalizations.of(context)!.translate('emailLabel'),
                    validatorCallBack: emptyValidator,
                    userInformation: userInformation,
                    keyString: "email",
                  ),
                  TextFormFieldComponent(
                    validatorCallBack: emptyValidator,
                    labelText: AppLocalizations.of(context)!
                        .translate('passwordLabel'),
                    isPassword: true,
                    userInformation: userInformation,
                    keyString: "password",
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
                      buttonName:
                          AppLocalizations.of(context)!.translate("login"),
                      function: callLoginService,
                    ),
                  ),
                  TextButtonComponent(
                    buttonName: AppLocalizations.of(context)!
                        .translate("forgotPassword"),
                    function: callForgetPasswordService,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
