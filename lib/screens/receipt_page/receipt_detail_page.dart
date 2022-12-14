import 'package:flutter/material.dart';
import 'package:test_responsive_ui/models/receipt_model/receipt_model.dart';

class ReceiptDetailPage extends StatelessWidget {
  final List<Data>? receiptData;
  final int? index;
  ReceiptDetailPage({super.key, this.receiptData, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: receiptData != null && index != null
            ? Text("# ${receiptData![index!].receiptId}")
            : Text(''),
        automaticallyImplyLeading:
            MediaQuery.of(context).size.width > 600 ? false : true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

 // SafeArea(
      //   child: SingleChildScrollView(
      //     child: Center(
      //       child: Column(
      //         children: [
      //           Padding(
      //             padding: MediaQuery.of(context).size.width > 600
      //                 ? EdgeInsets.all(20.0)
      //                 : EdgeInsets.all(0.0),
      //             child: Container(
      //               height: MediaQuery.of(context).size.height,
      //               padding: const EdgeInsets.all(10.0),
      //               decoration: BoxDecoration(
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.black,
      //                     offset: const Offset(
      //                       2.0,
      //                       2.0,
      //                     ), //Offset
      //                     blurRadius: 5.0,
      //                     spreadRadius: 2.0,
      //                   ), //BoxShadow
      //                   BoxShadow(
      //                     color: Colors.white,
      //                     offset: const Offset(0.0, 0.0),
      //                     blurRadius: 1.0,
      //                     spreadRadius: 1.0,
      //                   ), //BoxShadow
      //                 ],
      //               ),
      //               width: MediaQuery.of(context).size.width > 600
      //                   ? MediaQuery.of(context).size.width * 0.4
      //                   : MediaQuery.of(context).size.width,
      //               child: Column(
      //                 children: [
      //                   Text(
      //                     '100.00',
      //                     style: TextStyle(color: Colors.black, fontSize: 40.0),
      //                   ),
      //                   Text(
      //                     '??????????????????????????????',
      //                     style: Theme.of(context).textTheme.bodyText1,
      //                   ),
      //                   const Divider(
      //                     endIndent: 0,
      //                     color: Colors.black,
      //                   ),
      //                   Row(
      //                     children: [
      //                       Text(
      //                         '???????????????????????????: ?????????????????????',
      //                         style: TextStyle(color: Colors.black),
      //                       ),
      //                     ],
      //                   ),
      //                   Row(
      //                     children: [
      //                       Text('?????????????????????????????????????????????: POS4'),
      //                     ],
      //                   ),
      //                   const Divider(
      //                     endIndent: 0,
      //                     color: Colors.black,
      //                   ),
      //                   ListTile(
      //                       title: Text(
      //                         'product 1',
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.w500),
      //                       ),
      //                       subtitle: Text('1 x 20.0'),
      //                       trailing: Text(
      //                         '20.0',
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.w500),
      //                       )),
      //                   ListTile(
      //                       title: Text(
      //                         'product 2',
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.w500),
      //                       ),
      //                       subtitle: Text('1 x 20.0'),
      //                       trailing: Text(
      //                         '60.0',
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.w500),
      //                       )),
      //                   ListTile(
      //                       title: Text(
      //                         'product 3',
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.w500),
      //                       ),
      //                       subtitle: Text('1 x 20.0'),
      //                       trailing: Text(
      //                         '100.0',
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.w500),
      //                       )),
      //                   const Divider(
      //                     endIndent: 0,
      //                     color: Colors.black,
      //                   ),
      //                   ListTile(
      //                       title: Text('?????????????????????????????????100?????????'),
      //                       trailing: Text('-100.0')),
      //                   const Divider(
      //                     endIndent: 0,
      //                     color: Colors.black,
      //                   ),
      //                   ListTile(title: Text('?????????'), trailing: Text('100.0')),
      //                   const Divider(
      //                     endIndent: 0,
      //                     color: Colors.black,
      //                   ),
      //                   ListTile(
      //                       title: Text('??????????????????????????????'), trailing: Text('100.0')),
      //                   ListTile(
      //                       title: Text('??????????????????'), trailing: Text('100.0')),
      //                   const Divider(
      //                     endIndent: 0,
      //                     color: Colors.black,
      //                   ),
      //                   ListTile(
      //                       title: Text('10/11/2565'), trailing: Text('#-001')),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
