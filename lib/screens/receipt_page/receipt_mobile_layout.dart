import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';

class ReceiptMobileLayout extends StatelessWidget {
  const ReceiptMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.translate("receipt"),
          ),
        ),
        drawer: const DrawerComponent(),
        body: Column(
          children: [
            Container(
              height: 50.0,
              color: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return StickyHeader(
                    header: Column(
                      children: [
                        Container(
                          height: 30.0,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Header #$index',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    content: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.money),
                          title: Text('100.0 ฿'),
                          trailing: Text('001'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
