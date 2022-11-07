import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';

class SalePage extends StatefulWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("sale")),
      ),
      drawer: const DrawerComponent(),
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return saleLayoutTablet();
          } else {
            return saleLayoutMobile();
          }
        },
      )),
    );
  }

  Text saleLayoutMobile() {
    return Text("sale layout mobile");
  }

  Widget saleLayoutTablet() {
    return Text("sale layout tablet");
  }
}
