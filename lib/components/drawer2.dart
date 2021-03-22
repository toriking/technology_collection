// for文で大量生成する(ドロワーvertion)

import 'package:flutter/material.dart';
import '../technology_template/basics.dart';
import '../technology_template/tutorial.dart';
import '../technology_template/drawers.dart';
import '../technology_template/tabs.dart';
import '../technology_template/buttons.dart';
import '../technology_template/icon_collection.dart';

class DrawerItems extends StatefulWidget {
  DrawerItems({Key key}) : super(key: key);
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerItems> {
//   // アイコンの種類 変数
  int _selectdIndex = 0;
//   // アイテムの空の配列 定数
  final drawerItems = <ListTile>[];
  static const _drawerItemIcon = [
    Icons.description_outlined,
    Icons.create_outlined,
    Icons.dehaze,
    Icons.tab,
    Icons.radio_button_on,
    Icons.dashboard,
  ];
  static const _drawerItemIconName = [
    '基本文法',
    'チュートリアル',
    'ドロワー',
    '上タブと下タブ',
    'ボタン',
    'アイコン',
  ];
  var _routes = [
    Basics(),
    Tutorial(),
    Drawers(),
    Tabs(),
    Buttons(),
    IconCollection(),
  ];
  @override
  // リストを生成
  void initState() {
    super.initState();
    drawerItems.add(_UpdateActiveState(0));
    for (var i = 1; i < _drawerItemIconName.length; i++) {
      drawerItems.add(_UpdateDeactiveState(i));
    }
  }

// 合体リスト
  // ignore: non_constant_identifier_names
  ListTile _UpdateActiveState(int index) {
    return ListTile(
      leading: Icon(
        _drawerItemIcon[index],
      ),
      title: Text(
        _drawerItemIconName[index],
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListTile _UpdateDeactiveState(int index) {
    return ListTile(
      leading: Icon(
        _drawerItemIcon[index],
      ),
      title: Text(
        _drawerItemIconName[index],
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      drawerItems[_selectdIndex] = _UpdateDeactiveState(_selectdIndex);
      drawerItems[index] = _UpdateActiveState(index);
      _selectdIndex = index;
    });
  }

  // final items = List<String>.generate(100, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    //

    // ドロワー全体の幅など指定
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          'Technology collection',
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      )),
      body: _routes.elementAt(_selectdIndex),
      endDrawer: Drawer(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(_drawerItemIcon[index]),
              title: Text(_drawerItemIconName[index]),
              onTap: () {
                _onItemTapped(index);
              },
            );
          },
          itemCount: _drawerItemIconName.length,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
    );
    // child: ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       leading: Icon(Icons.home),
    //       onTap: () {},

    //       title: Text('${items[index]}'),
    //     );
    //   },
    // ),

    // SizedBox(
    //   height: 60,
    //   child: DrawerHeader(
    //     child: Text(
    //       'Collection',
    //       style: TextStyle(
    //         fontSize: 16,
    //         color: Colors.white,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //     decoration: BoxDecoration(
    //       color: Colors.amber,
    //     ),
    //   ),
    // ),

    // Container(
    //     width: MediaQuery.of(context).size.width,
    //     child: Drawer(
    //       child: ListView(children: drawerItems),
    //     ));
  }
}
