import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/models/receipt_model/receipt_model.dart';
import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';

class ReceiptMobileLayout extends StatelessWidget {
  final ReceiptModel receiptModel;
  final bool isLoodStatus;
  final Function runFilter;
  const ReceiptMobileLayout({
    super.key,
    required this.receiptModel,
    required,
    required this.isLoodStatus,
    required this.runFilter,
  });

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
              child: TextField(
                onChanged: (value) => runFilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
            ),
            isLoodStatus != true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: receiptModel.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StickyHeader(
                          header: Column(
                            children: [
                              Container(
                                height: 30.0,
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  receiptModel.data![index].orderDate
                                      .toString(),
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                          content: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.money),
                                title: Text(
                                  receiptModel.data![index].sumTotal.toString(),
                                ),
                                trailing: Text(
                                  "# ${receiptModel.data![index].receiptId.toString()}",
                                ),
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
