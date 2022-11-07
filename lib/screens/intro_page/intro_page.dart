import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:test_responsive_ui/screens/sale_page/sale_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
        title: "ระบบคิดเงิน",
        styleTitle: TextStyle(color: Colors.grey.shade800, fontSize: 30),
        styleDescription: TextStyle(color: Colors.grey.shade800),
        description:
            "ขายจากสมารืทโฟนหรือแท็ปเล็ต, พิมพ์หรือใบเสร็จรับเงินอิเล็กทรอเล็กทรอนิกส์",
        pathImage: "assets/images/intro_screen_1.jpg",
        backgroundColor: Color(0xffffffff),
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "ระบบหลังร้าน",
        styleTitle: TextStyle(color: Colors.grey.shade800, fontSize: 30),
        styleDescription: TextStyle(color: Colors.grey.shade800),
        description:
            "ติดตามยอดขายสินค้าเเละสินค้าคงคลังของคุณจัดการพนักงานและลุกค้าในเบราวืเซอร์บนอุปกรร์ใดๆ",
        pathImage: "assets/images/intro_screen_2.jpg",
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "แอพเสริมการใช้งาน",
        styleTitle: TextStyle(color: Colors.grey.shade800, fontSize: 30),
        styleDescription: TextStyle(color: Colors.grey.shade800),
        description:
            "ติดตั้ง Dashboard, ระบบจอเเสดงผลในห้องครัว และแอพแสดงผลลูกค้าเพื่อจัดการธุรกิจที่มีประสิทธิภาพยิ่งขึ้น",
        pathImage: "assets/images/intro_screen_3.jpg",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(pageBuilder: (_, __, ___) => const SalePage()),
        (route) => false);
  }

  void onSkipPress() {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(pageBuilder: (_, __, ___) => const SalePage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
      onSkipPress: onSkipPress,
    );
  }
}
