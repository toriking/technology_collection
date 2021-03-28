import 'package:flutter/material.dart';
import 'basics_drawer_pages/page1.dart';

// シンプルな書き方
// class Routes {
//   static const String page1 = Page1.routeName;
// }

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'drawers',
      theme: ThemeData(primaryColor: Colors.yellow),
      home: DrawersScreen(),
      routes: {'/page1': (BuildContext context) => Page1()},
    );
  }
}

class DrawersScreen extends StatefulWidget {
  @override
  _DrawersScreenState createState() => _DrawersScreenState();
}

class _DrawersScreenState extends State<DrawersScreen> {
  bool _value = false;
  static int _len = 10;
  void _onchanged(bool _value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('標準ドロワー'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: _len,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                  title: Text('uuu'), value: _value, onChanged: _onchanged);
            }),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('ページ1へ'),
              leading: Icon(Icons.widgets),
              trailing: Icon(Icons.arrow_back),
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.pushNamed(context, '/page1');
              },
            ),
          ],
        ),
      ),
    );
  }
}
