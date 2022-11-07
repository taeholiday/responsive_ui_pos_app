import 'package:flutter/material.dart';

String? emptyValidator(BuildContext context, String? value) {
  if (value?.isEmpty ?? true) {
    return "กรุณากรอกข้อมูล";
  }
  return null;
}
