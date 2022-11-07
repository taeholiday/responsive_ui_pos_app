// ignore_for_file: use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/constants/validate_management/empty_validate.dart';
import 'package:test_responsive_ui/screens/intro_page/intro_page.dart';
import 'package:test_responsive_ui/screens/login_page/login_page.dart';
import 'package:test_responsive_ui/shared_components/button_components/button_component.dart';
import 'package:test_responsive_ui/shared_components/button_components/text_button_component.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared_components/text_form_field_components/text_form_field_component.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  bool isChecked = false;
  TextEditingController _controller = TextEditingController();
  List<String> dataBusinessType = [
    "ร้านกาเเฟ / ค่าเฟ่",
    "ร้านอาหาร",
    "บาร์",
    "ร้านขายของชำ",
    "ร้านขายยา",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("register")),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  return registerLayoutTablet();
                } else {
                  return registerLayoutMobile();
                }
              },
            ),
          ),
        ),
      )),
    );
  }

  Widget registerLayoutTablet() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width > 800
            ? MediaQuery.of(context).size.width * 0.3
            : MediaQuery.of(context).size.width > 600
                ? MediaQuery.of(context).size.width * 0.5
                : MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormFieldComponent(
              labelText: AppLocalizations.of(context)!.translate("emailLabel"),
              validatorCallBack: emptyValidator,
            ),
            TextFormFieldComponent(
              validatorCallBack: emptyValidator,
              labelText:
                  AppLocalizations.of(context)!.translate("passwordLabel"),
              isPassword: true,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: TextFormFieldComponent(
                    labelText: AppLocalizations.of(context)!
                        .translate("firstNameLabel"),
                    validatorCallBack: emptyValidator,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormFieldComponent(
                    labelText: AppLocalizations.of(context)!
                        .translate("lastNameLabel"),
                    validatorCallBack: emptyValidator,
                  ),
                ),
              ],
            ),
            TextFormFieldComponent(
              labelText:
                  AppLocalizations.of(context)!.translate("phoneNumberLabel"),
              validatorCallBack: emptyValidator,
            ),
            TextFormFieldComponent(
              labelText:
                  AppLocalizations.of(context)!.translate("storeNameLabel"),
              validatorCallBack: emptyValidator,
            ),
            const SizedBox(height: 10.0),
            dropdownSelectBusinessType(),
            agreeToTheTermsOfUse(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              height: 50.0,
              width: MediaQuery.of(context).size.width > 800
                  ? MediaQuery.of(context).size.width * 0.4
                  : MediaQuery.of(context).size.width > 600
                      ? MediaQuery.of(context).size.width * 0.5
                      : MediaQuery.of(context).size.width * 0.9,
              child: ButtonComponent(
                buttonName: AppLocalizations.of(context)!.translate("register"),
                function: callRegisterService,
              ),
            ),
            loginButton()
          ],
        ),
      ),
    );
  }

  registerLayoutMobile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TextFormFieldComponent(
            labelText: AppLocalizations.of(context)!.translate("emailLabel"),
            validatorCallBack: emptyValidator,
          ),
          TextFormFieldComponent(
            validatorCallBack: emptyValidator,
            labelText: AppLocalizations.of(context)!.translate("passwordLabel"),
            isPassword: true,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                child: TextFormFieldComponent(
                  labelText:
                      AppLocalizations.of(context)!.translate("firstNameLabel"),
                  validatorCallBack: emptyValidator,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: TextFormFieldComponent(
                  labelText:
                      AppLocalizations.of(context)!.translate("lastNameLabel"),
                  validatorCallBack: emptyValidator,
                ),
              ),
            ],
          ),
          TextFormFieldComponent(
            labelText:
                AppLocalizations.of(context)!.translate("phoneNumberLabel"),
            validatorCallBack: emptyValidator,
          ),
          TextFormFieldComponent(
            labelText:
                AppLocalizations.of(context)!.translate("storeNameLabel"),
            validatorCallBack: emptyValidator,
          ),
          const SizedBox(height: 10.0),
          dropdownSelectBusinessType(),
          agreeToTheTermsOfUse(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            height: 50.0,
            width: MediaQuery.of(context).size.width > 800
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.9,
            child: ButtonComponent(
              buttonName: AppLocalizations.of(context)!.translate("register"),
              function: callRegisterService,
            ),
          ),
          loginButton()
        ],
      ),
    );
  }

  Container loginButton() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(AppLocalizations.of(context)!.translate("signInHere")),
        TextButtonComponent(
          buttonName: AppLocalizations.of(context)!.translate("login"),
          function: callLoginPage,
        )
      ]),
    );
  }

  callLoginPage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginPage()),
    );
  }

  Container agreeToTheTermsOfUse() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white, // color of tick Mark
            activeColor: Colors.green,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextButtonComponent(
              buttonName: AppLocalizations.of(context)!
                  .translate("acceptThePOSApplication"),
              function: callAcceptThePOSApplication,
            ),
          )
        ],
      ),
    );
  }

  callAcceptThePOSApplication() async {
    final Uri _url = Uri.parse("https://www.google.co.th/");
    if (await canLaunchUrl(_url)) {
      await launchUrl(
        _url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade200,
          duration: const Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!
              .translate("youDon'tHaveAWebBrowser")),
        ),
      );
    }
  }

  callRegisterService(BuildContext context) {
    if (formkey.currentState!.validate() == false && _controller.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade200,
          duration: const Duration(seconds: 1),
          content: Text(
              AppLocalizations.of(context)!.translate("chooseBusinessType")),
        ),
      );
    } else if (isChecked == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade200,
          duration: const Duration(seconds: 1),
          content: Text(AppLocalizations.of(context)!
              .translate("pleaseAcceptTheTermsOfUse")),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (_, __, ___) => const IntroPage()),
      );
    }
  }

  InkWell dropdownSelectBusinessType() {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            // barrierDismissible: false, //must tap button
            builder: (BuildContext context) {
              return _buildPopupBusinessTypeDialog(context);
            }).then((value) {
          if (value != null) {
            setState(() {
              _controller.text = value;
            });
          }
        });
      },
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyText1,
        enabled: false,
        controller: _controller,
        decoration: InputDecoration(
          labelText:
              AppLocalizations.of(context)!.translate("chooseBusinessType"),
          labelStyle: Theme.of(context).textTheme.bodyText1,
          suffixIcon: const Icon(
            Icons.arrow_drop_down,
          ),
        ),
      ),
    );
  }

  _buildPopupBusinessTypeDialog(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.minPositive,
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dataBusinessType.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.pop(context, dataBusinessType[index]);
              },
              title: Text(dataBusinessType[index]),
            );
          },
        ),
      ),
    );
  }
}
