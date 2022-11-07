import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_page.dart';
import 'package:test_responsive_ui/screens/sale_page/sale_page.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [showHead(), saleMenu(context), receiptMenu(context)],
      ),
    );
  }

  ListTile receiptMenu(BuildContext context) => ListTile(
        leading: Icon(Icons.receipt),
        title: Text(AppLocalizations.of(context)!.translate("receipt")),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const ReceiptPage()),
              (route) => false);
        },
      );

  ListTile saleMenu(BuildContext context) => ListTile(
        leading: Icon(Icons.shopping_basket),
        title: Text(AppLocalizations.of(context)!.translate("sale")),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => const SalePage()),
              (route) => false);
        },
      );

  UserAccountsDrawerHeader showHead() {
    return const UserAccountsDrawerHeader(
      accountName: Text(
        'Name Login',
      ),
      accountEmail: Text(
        'Login',
      ),
    );
  }
}
