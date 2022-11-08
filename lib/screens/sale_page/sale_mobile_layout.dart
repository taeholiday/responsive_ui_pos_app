import 'package:flutter/material.dart';
import 'package:test_responsive_ui/app_localization.dart';
import 'package:test_responsive_ui/shared_components/drawer_components/drawer_component.dart';

class SaleMobileLayout extends StatelessWidget {
  const SaleMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Container(
          width: 100,
          child: Text(
            "${AppLocalizations.of(context)!.translate("ticket")} 0",
            style: Theme.of(context).textTheme.button,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_add),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: const DrawerComponent(),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(15.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Container(
                  height: 60.0,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!
                              .translate("charge")),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("0.00"),
                        ],
                      )),
                ),
              ),
            ]),
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            height: 50.0,
            color: Colors.white,
          ),
          Divider(
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
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
          ),
        ],
      )),
    );
  }
}
