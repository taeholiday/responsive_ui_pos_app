import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('receipt')),
      ),
      drawer: DrawerComponent(),
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return receiptLayoutTablet();
          } else {
            return receiptLayoutMobile();
          }
        },
      )),
    );
  }

  Text receiptLayoutMobile() {
    return Text("receipt layout mobile");
  }

  Widget receiptLayoutTablet() {
    return Text("receipt layout tablet");
  }
}
