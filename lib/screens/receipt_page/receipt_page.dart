import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/models/receipt_model/receipt_model.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_mobile_layout.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_tablet_layout.dart';
import 'package:test_responsive_ui/service/receipt_service/receipt_service.dart';
import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';
import 'package:test_responsive_ui/shared_components/responsive/responsive_layout.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  ReceiptModel receiptModel = ReceiptModel();

  @override
  void initState() {
    super.initState();
    fetchReceiptModel();
  }

  fetchReceiptModel() async {
    ReceiptModel tempReceiptModel = await ReceiptService().fetchReceiptData();
    if (tempReceiptModel != null && mounted) {
      receiptModel = tempReceiptModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: ReceiptMobileLayout(), tabletBody: ReceiptTabletLayout());
  }

  Text receiptLayoutMobile() {
    return Text("receipt layout mobile");
  }

  Widget receiptLayoutTablet() {
    return Text("receipt layout tablet");
  }
}
