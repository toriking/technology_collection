import 'package:flutter/material.dart';
import 'basics_drawer_pages/page1.dart';

// シンプルな書き方
class Routes {
  static const String page1 = Page1.routeName;
}

class Drawers extends StatelessWidget {
  static const String routeName = '/page1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('標準ドロワー'),
      ),
      body: Center(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('ページ1へ'),
              leading: Icon(Icons.widgets),
              trailing: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, Routes.page1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
