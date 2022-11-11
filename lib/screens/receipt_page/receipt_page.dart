import 'package:flutter/material.dart';
import 'package:test_responsive_ui/models/receipt_model/receipt_model.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_mobile_layout.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_tablet_layout.dart';
import 'package:test_responsive_ui/service/receipt_service/receipt_service.dart';
import 'package:test_responsive_ui/shared_components/responsive/responsive_layout.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  ReceiptModel receiptModel = ReceiptModel();
  bool isLoodStatus = false;
  List<Data>? receiptData = [];

  @override
  void initState() {
    super.initState();
    fetchReceiptModel();
  }

  fetchReceiptModel() async {
    ReceiptModel tempReceiptModel = await ReceiptService().fetchReceiptData();
    if (tempReceiptModel != null && mounted) {
      setState(() {
        receiptModel = tempReceiptModel;
        isLoodStatus = true;
      });
    }
    receiptData = receiptModel.data;
  }

  void _runFilter(String enteredKeyword) {
    List<Data>? results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = receiptModel.data;
    } else {
      results = receiptModel.data!
          .cast<Data>()
          .where((element) => element.orderDate!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .cast<Data>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      receiptData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: ReceiptMobileLayout(
          receiptData: receiptData!,
          isLoodStatus: isLoodStatus,
          runFilter: _runFilter,
        ),
        tabletBody: ReceiptTabletLayout(
          receiptData: receiptData!,
          isLoodStatus: isLoodStatus,
          runFilter: _runFilter,
        ));
  }
}
