import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test_responsive_ui/models/receipt_model/receipt_model.dart';

class ReceiptService {
  ReceiptService();

  fetchReceiptData() async {
    String responseString =
        await rootBundle.loadString('assets/mok_data/receipt_data.json');
    var jsonResponse = json.decode(responseString);
    ReceiptModel receiptModel;
    if (jsonResponse != null) {
      receiptModel = ReceiptModel.fromJson(jsonResponse);
      return receiptModel;
    }
  }
}
