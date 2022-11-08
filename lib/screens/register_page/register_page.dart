// ignore_for_file: use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/screens/intro_page/intro_page.dart';
import 'package:test_responsive_ui/screens/login_page/login_page.dart';
import 'package:test_responsive_ui/screens/register_page/register_mobile_layout.dart';
import 'package:test_responsive_ui/screens/register_page/register_tablet_layout.dart';
import 'package:test_responsive_ui/shared_components/button_components/text_button_component.dart';
import 'package:test_responsive_ui/shared_components/responsive/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  bool isChecked = false;
  final TextEditingController _controller = TextEditingController();
  List<String> dataBusinessType = [
    "ร้านกาเเฟ / ค่าเฟ่",
    "ร้านอาหาร",
    "บาร์",
    "ร้านขายของชำ",
    "ร้านขายยา",
  ];

  Map<String, dynamic> userInformation = {
    "email": "",
    "password": "",
    "firstName": "",
    "lastName": "",
    "phoneNumber": "",
    "storeName": "",
    "businessType": "",
  };
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: RegisterMobileLayout(
          agreeToTheTermsOfUse: agreeToTheTermsOfUse(),
          dropdownSelectBusinessType: dropdownSelectBusinessType(),
          callLoginPage: callLoginPage,
          callRegisterService: callRegisterService,
          formkey: formkey,
          userInformation: userInformation,
        ),
        tabletBody: RegisterTabletLayout(
          agreeToTheTermsOfUse: agreeToTheTermsOfUse(),
          dropdownSelectBusinessType: dropdownSelectBusinessType(),
          callLoginPage: callLoginPage,
          callRegisterService: callRegisterService,
          formkey: formkey,
          userInformation: userInformation,
        ));
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

  Widget agreeToTheTermsOfUse() {
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
      userInformation["businessType"] = _controller.text;
      print("userInformation Register");
      print(userInformation);
      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(pageBuilder: (_, __, ___) => const IntroPage()),
      // );
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
