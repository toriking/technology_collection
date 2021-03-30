import 'package:flutter/material.dart';
//
// import 'package:provider/provider.dart';

// ページ
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

  static const _drawerItemIcon = [
    Icons.description_outlined,
    Icons.create_outlined,
    Icons.dehaze,
    Icons.tab,
    Icons.radio_button_on,
    Icons.dashboard,
  ];
  static const drawerItemName = [
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
    for (var i = 1; i < drawerItemName.length; i++) {
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
        drawerItemName[index],
        style: TextStyle(color: Colors.black),
      ),
      // trailing: Checkbox(
      //   checked: tasks[index],
      //   onChanged: (bool checked) {},
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
        drawerItemName[index],
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

  // void _onchanged() {}

  static int _len = 6;
  List<bool> isChecked = List.generate(_len, (index) => false);

  @override
  Widget build(BuildContext context) {
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
            //     checked: _switchValue,
            //     onChanged: (bool checked) {
            //       setState(() {
            //         _switchValue = checked;
            //       });
            //     })
            // ],
          ),
          body: _routes.elementAt(_selectdIndex),
          endDrawer: Drawer(
            child: ListView.builder(
              // アイテムの数だけリストを作る
              itemCount: drawerItemName.length,
              itemBuilder: (context, index) {
                // 取得したいところをラップする
                return ListTile(
                  leading: Icon(_drawerItemIcon[index]),
                  title: Text(
                    drawerItemName[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    _onItemTapped(index);
                  },
                  // チェックボックス
                  trailing: Checkbox(
                    value: isChecked[index],
                    onChanged: (bool val) {
                      // var checklist = String('');
                      // _ItemModel.add(checklist);
                      Navigator.of(context).pop(isChecked);
                      setState(() {
                        if (!val) {
                          isChecked[index] = false;
                          _SelectedDrawer();
                        } else {
                          isChecked[index] = true;
                        }
                        // isChecked[index] = val;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          drawer: SelectedDrawer()),
    );
  }
}

// endDrawerのチェックされたものをうけとる
class SelectedDrawer extends StatefulWidget {
  // チェックされたもの入れる箱
  // list<String> selectedList = [];
  _SelectedDrawer createState() => _SelectedDrawer();
}

class _SelectedDrawer extends State<SelectedDrawer> {
  final List<String> checkedList = [];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: checkedList.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: ListTile(
              title: Text(checkedList[index]),
              // leading: Icon(checked, items[index].icon),
              // title: Text(checked.title),
            ),
          );
        },
      ),
    );
  }
}
