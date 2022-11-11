import 'package:flutter/material.dart';
import 'package:test_responsive_ui/models/receipt_model/receipt_model.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_detail_page.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_mobile_layout.dart';

class ReceiptTabletLayout extends StatelessWidget {
  final List<Data> receiptData;
  final bool isLoodStatus;
  final Function runFilter;
  const ReceiptTabletLayout({
    super.key,
    required this.receiptData,
    required this.isLoodStatus,
    required this.runFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: ReceiptMobileLayout(
                    receiptData: receiptData,
                    isLoodStatus: isLoodStatus,
                    runFilter: runFilter),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.yellow,
                child: ReceiptDetailPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
