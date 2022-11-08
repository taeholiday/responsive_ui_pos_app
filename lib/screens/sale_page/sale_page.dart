// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:test_responsive_ui/screens/sale_page/sale_mobile_layout.dart';
import 'package:test_responsive_ui/screens/sale_page/sale_tablet_layout.dart';
import 'package:test_responsive_ui/shared_components/responsive/responsive_layout.dart';

class SalePage extends StatefulWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: SaleMobileLayout(),
      tabletBody: SaleTabletLayout(),
    );
  }
}
