import 'package:flutter/material.dart';

class TechnologyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // アカウントレイアウトWidget
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.only(bottom: 0),
            accountName: Text('Torii'),
            accountEmail: Text('22321@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                '',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ],
          ),

          // 一覧 titleタイトル subtitleサブタイトル titleColor色 leading前端 trailing後端 onTapタップ時イベント

          ListTile(
            title: Text('使いたい技術リスト'),
          ),
        ],
      ),
    );
  }
}
