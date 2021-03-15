import 'package:flutter/material.dart';


class TechnologyEndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:<Widget>[
              ListTile(
                title: Text('使いたい技術リスト'),
              ),

              ListTile(
                title: Text(
                  'Flutterチュートリアル',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                subtitle: Text('part1,2'),
                // tileColor: Colors.black,
                leading: Icon(Icons.list_alt),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('その他'),
                onTap: () {
                  // タップ時にDrawer閉じる
                  // Navigator.of(context).pop();
                  // Navigator.of(context).pushNamed('/second');
                },
              ),
              ListTile(
                leading: Icon(Icons.emoji_objects_outlined),
                trailing: Icon(Icons.arrow_forward),
                title: Text('tete'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/tete');
                },
              ),
            ],
          ),
    );
  }
}