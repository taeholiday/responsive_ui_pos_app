import 'package:flutter/material.dart';

String? emailFormatValidator(BuildContext context, String? email) {
  if (email?.isEmpty ?? true) {
    return "กรุณากรอกข้อมูลห้ามว่าง";
  } else if (!RegExp(
          "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)[&&.]")
      .hasMatch(email!)) {
    return "กรุณากรอกข้อมูลด้วยรูปแบบอีเมล";
  }
  return null;
}
