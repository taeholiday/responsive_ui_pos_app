import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/models/receipt_model/receipt_model.dart';
import 'package:test_responsive_ui/screens/receipt_page/receipt_detail_page.dart';
import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';

class ReceiptMobileLayout extends StatelessWidget {
  final List<Data> receiptData;
  final bool isLoodStatus;
  final Function runFilter;
  const ReceiptMobileLayout({
    super.key,
    required this.receiptData,
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
                style: Theme.of(context).textTheme.bodyText1,
                onChanged: (value) => runFilter(value),
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    labelText:
                        AppLocalizations.of(context)!.translate("findDate"),
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
            isLoodStatus != true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: receiptData.isNotEmpty
                        ? ListView.builder(
                            itemCount: receiptData.length,
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
                                        receiptData[index].orderDate.toString(),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                                content: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  const ReceiptDetailPage()),
                                        );
                                      },
                                      leading: const Icon(Icons.money),
                                      title: Text(
                                        receiptData[index].sumTotal.toString(),
                                      ),
                                      trailing: Text(
                                        "# ${receiptData[index].receiptId.toString()}",
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Text(AppLocalizations.of(context)!
                            .translate("noInformationFound")),
                  )
          ],
        ));
  }
}
