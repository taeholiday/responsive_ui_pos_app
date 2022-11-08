import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/constants/validate_management/empty_validate.dart';
import 'package:test_responsive_ui/shared_components/button_components/button_component.dart';
import 'package:test_responsive_ui/shared_components/button_components/text_button_component.dart';
import 'package:test_responsive_ui/shared_components/text_form_field_components/text_form_field_component.dart';

class RegisterTabletLayout extends StatelessWidget {
  final Widget dropdownSelectBusinessType;
  final Widget agreeToTheTermsOfUse;
  final Function callRegisterService;
  final Function callLoginPage;
  final formkey;
  final Map<String, dynamic> userInformation;
  const RegisterTabletLayout({
    super.key,
    required this.dropdownSelectBusinessType,
    required this.agreeToTheTermsOfUse,
    required this.callLoginPage,
    required this.callRegisterService,
    required this.formkey,
    required this.userInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("register")),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width > 800
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width > 600
                        ? MediaQuery.of(context).size.width * 0.5
                        : MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormFieldComponent(
                            labelText: AppLocalizations.of(context)!
                                .translate("emailLabel"),
                            validatorCallBack: emptyValidator,
                            userInformation: userInformation,
                            keyString: "email",
                          ),
                          TextFormFieldComponent(
                            validatorCallBack: emptyValidator,
                            labelText: AppLocalizations.of(context)!
                                .translate("passwordLabel"),
                            isPassword: true,
                            userInformation: userInformation,
                            keyString: "password",
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: TextFormFieldComponent(
                                  labelText: AppLocalizations.of(context)!
                                      .translate("firstNameLabel"),
                                  validatorCallBack: emptyValidator,
                                  userInformation: userInformation,
                                  keyString: "firstName",
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormFieldComponent(
                                  labelText: AppLocalizations.of(context)!
                                      .translate("lastNameLabel"),
                                  validatorCallBack: emptyValidator,
                                  userInformation: userInformation,
                                  keyString: "lastName",
                                ),
                              ),
                            ],
                          ),
                          TextFormFieldComponent(
                            labelText: AppLocalizations.of(context)!
                                .translate("phoneNumberLabel"),
                            validatorCallBack: emptyValidator,
                            userInformation: userInformation,
                            keyString: "phoneNumber",
                          ),
                          TextFormFieldComponent(
                            labelText: AppLocalizations.of(context)!
                                .translate("storeNameLabel"),
                            validatorCallBack: emptyValidator,
                            userInformation: userInformation,
                            keyString: "storeName",
                          ),
                          const SizedBox(height: 10.0),
                          dropdownSelectBusinessType,
                          agreeToTheTermsOfUse,
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15.0),
                            height: 50.0,
                            width: MediaQuery.of(context).size.width > 800
                                ? MediaQuery.of(context).size.width * 0.4
                                : MediaQuery.of(context).size.width > 600
                                    ? MediaQuery.of(context).size.width * 0.5
                                    : MediaQuery.of(context).size.width * 0.9,
                            child: ButtonComponent(
                              buttonName: AppLocalizations.of(context)!
                                  .translate("register"),
                              function: callRegisterService,
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppLocalizations.of(context)!
                                    .translate("signInHere")),
                                TextButtonComponent(
                                  buttonName: AppLocalizations.of(context)!
                                      .translate("login"),
                                  function: callLoginPage,
                                )
                              ])
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
