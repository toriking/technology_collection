// for文で大量生成する(ドロワーvertion)

import 'package:flutter/material.dart';
import '../technology_template/basics.dart';
import '../technology_template/tutorial.dart';
import '../technology_template/drawers.dart';
import '../technology_template/tabs.dart';
import '../technology_template/buttons.dart';
import '../technology_template/icon_collection.dart';

class DrawerItems extends StatefulWidget {
  final String title;
  DrawerItems({Key key, this.title}) : super(key: key);
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerItems> {
// アイコンの種類 変数
  int _selectdIndex = 0;
// アイテムの空の配列 定数
  final drawerItems = <ListTile>[];
  // List<Widget> _routes = <Widget>[
  //   // Home(),
  //   Basics(),
  // ];

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

  // static const _checkbox = [];
  var _routes = [
    Basics(),
    Tutorial(),
    Drawers(),
    Tabs(),
    Buttons(),
    IconCollection(),
  ];

  get listBool => null;

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
      // trailing: Checkbox(
      //   value: tasks[index],
      //   onChanged: (bool value) {},
      // ),
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

  // void _onchanged(int index) {
  //   setState(() {
  //     checkbox[index] = true;
  //   });
  // }

  // void onToggle(tasks) {
  //   setState(() {
  //     tasks.setCompleted(!tasks.isCompleted());
  //   });
  // }

  // final tasks = [];

  bool _value = false;
  @override
  Widget build(BuildContext context) {
    //

    // ドロワー全体の幅など指定
    return Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/icon/logo-sample.jpg'),
        //         fit: BoxFit.cover)),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'te',
                style: TextStyle(color: Colors.pink),
              ),

              //   title: Center(
              // child: Text(
              //   'Technology collection',
              //     style: TextStyle(
              //       color: Colors.black,
              //     ),
              // ),
              // )

              // actions: <Widget>[
              // SwitchListTile(
              //     value: _switchValue,
              //     onChanged: (bool value) {
              //       setState(() {
              //         _switchValue = value;
              //       });
              //     })
              // ],
            ),
            body: _routes.elementAt(_selectdIndex),
            endDrawer: Drawer(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(_drawerItemIcon[index]),
                    title: Text(
                      _drawerItemIconName[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      _onItemTapped(index);
                    },
                    trailing: Checkbox(
                      value: _value,
                      onChanged: (bool _value) {
                        _value = true;
                        setState(() {
                          _value = _value;
                        });
                      },
                    ),
                  );
                },
                itemCount: _drawerItemIconName.length,
              ),
            ),
            drawer: SelectedDrawer()));
  }
}

// チェックボックスにチェック入れたものの管理
class SelectedDrawer extends StatefulWidget {
  @override
  SelectedDrawerState createState() => SelectedDrawerState();
}

class SelectedDrawerState extends State<SelectedDrawer> {
  // チェックされたもの入れる箱
  // list<String> selectedList = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
        // itemCount: selectedList.length,
        itemBuilder: (BuildContext context, int index) {
      return Container();
    }));
  }
}
