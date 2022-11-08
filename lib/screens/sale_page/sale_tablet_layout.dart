import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';

import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';

class SaleTabletLayout extends StatelessWidget {
  const SaleTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: Scaffold(
              backgroundColor: Colors.grey.shade200,
              appBar: AppBar(actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ]),
              drawer: const DrawerComponent(),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: Image.asset('assets/images/logo.png'),
                      footer: Container(
                        height: 50,
                        color: const Color(0xff000000).withOpacity(0.3),
                        child: Center(
                            child: Text(
                          'product ${index + 1}',
                          style: Theme.of(context).textTheme.button,
                        )),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 5 : 3,
                  ),
                ),
              ),
            )),
        Expanded(
            flex: 2,
            child: Container(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Container(
                    width: 120,
                    child: Text(
                      AppLocalizations.of(context)!.translate("ticket"),
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_add,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                body: ListView(),
                bottomSheet: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                        height: 60.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(AppLocalizations.of(context)!
                              .translate("charge")
                              .toUpperCase()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
