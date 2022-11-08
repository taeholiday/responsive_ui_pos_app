import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';

class ReceiptTabletLayout extends StatelessWidget {
  const ReceiptTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate("receipt"),
        ),
      ),
    );
  }
}
