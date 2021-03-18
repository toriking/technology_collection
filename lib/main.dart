// コメント多いですが自分なりの解釈です　なるべくべた書きします
// 使いたいパッケージを呼ぶよ
import 'package:flutter/material.dart';
// 外部ファイルを使うよ
import './technology_template/tete.dart';
import 'components/drawer.dart';

// アプリを起動するよ ワンライナー
void main() => runApp(MyApp());

// MyAppはStatelessWidgetクラスを継承します アプリの状態Stateを扱わない
class MyApp extends StatelessWidget {
  // 継承 書き換え
  @override
  // buildメソッド
  Widget build(BuildContext context) {
    // MaterialAppでラップするよ
    return MaterialApp(
        // titleタイトルhome theme色
        title: 'Technology collection',
        // テーマカラー
        theme: ThemeData(primaryColor: Colors.red),
        // HomeScreenを呼ぶよ
        home: HomeScreen(title: 'Home Screen'),
        // routes: <String, WidgetBuilder>{
        //   Routes.home: (BuildContext context) =>
        //       HomeScreen(title: 'Home Screen'),
        //   Routes.tete: (BuildContext context) => NewView1(),
        });
  }
}

class Routes {
  static const String home = '/home';
  static const String tete = '/tete';
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final drawerItems = <DrawerItem>[];
  var _routes = [
    HomeScreen(),
    Tete(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _drawerItems[_selectdIndex] = _UpdateDeactiveState(_selectedIndex);
      _drawerItems[index] = _UpdateActiveState(index);
      _selectedIndex = index;
    });
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //           backgroundColor: Colors.blue,
  //           title: Center(
  //             child: Text(
  //               widget.title,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 25),
  //             ),
  //           )),
  //       drawer: TechnologyDrawer(),
  //       endDrawer: TechnologyEndDrawer(),
  //       body: Center(
  //           child: Container(
  //         // マージン左右の100上下10
  //         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //         height: 800,
  //         width: 900,
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.green),
  //         ),

  //         // 縦並び
  //         child: Column(
  //           children: <Widget>[
  //             TextButton(onPressed: () {}, child: Text('テキストボタン')),
  //             ElevatedButton(onPressed: () {}, child: Text('aaaa')),
  //             // 2021 OutlineButton=>OutlinedButtonに変わった
  //             OutlinedButton(
  //               onPressed: () {},
  //               child: Text('アウトラインボタン'),
  //             )
  //           ],
  //         ),
  //       ),

  //       ));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _routes.elementAt(_selectedIndex),
      drawer: TechnologyDrawer(),
      endDrawer: TechnologyEndDrawer(),
    );
  }
}

// homeプロパティのRandmWordsはStatefulWigidetクラスを継承します アプリの状態Stateを扱う
// class HomeScreen extends StatefulWidget {
//   @override
//   // createState関数でホーム画面で扱うStateを指定
//   HomeScreenState createState() => HomeScreenState();
// }

// class HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Technology collection'),
//         ),
//         // 画面変遷

//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               // アカウントレイアウト
//               UserAccountsDrawerHeader(
//                 margin: const EdgeInsets.only(bottom: 0),
//                 accountName: Text('Torii'),
//                 accountEmail: Text('22321@gmail.com'),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundColor:
//                       Theme.of(context).platform == TargetPlatform.iOS
//                           ? Colors.blue
//                           : Colors.white,
//                   child: Text(
//                     '',
//                     style: TextStyle(fontSize: 40.0),
//                   ),
//                 ),
//                 otherAccountsPictures: [
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                   ),
//                 ],
//               ),

//               // 一覧 titleタイトル subtitleサブタイトル titleColor色 leading前端 trailing後端 onTapタップ時イベント

//               ListTile(
//                 title: Text('使いたい技術リスト'),
//               ),

//               ListTile(
//                 title: Text(
//                   'Flutterチュートリアル',
//                   style: TextStyle(fontSize: 16, color: Colors.red),
//                 ),
//                 subtitle: Text('part1,2'),
//                 // tileColor: Colors.black,
//                 leading: Icon(Icons.list_alt),
//                 trailing: Icon(Icons.arrow_forward),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: Icon(Icons.account_circle),
//                 title: Text('その他'),
//                 onTap: () {
//                   // タップ時にDrawer閉じる
//                   // Navigator.of(context).pop();
//                   // Navigator.of(context).pushNamed('/second');
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.emoji_objects_outlined),
//                 trailing: Icon(Icons.arrow_forward),
//                 title: Text('tete'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).pushNamed('/tete');
//                 },
//               ),
//             ],
//           ),
//         ),
//         endDrawer: ClipRRect(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
//           child: Drawer(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: <Widget>[
//                 SizedBox(
//                   height: 60,
//                   child: DrawerHeader(
//                     margin: const EdgeInsets.only(bottom: 0),
//                     // padding: EdgeInsets.zero,
//                     child: Text(
//                       '学習リスト',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                     ),
//                     padding: EdgeInsets.zero,
//                   ),
//                 ),
//                 ListTile(
//                   title: Text(
//                     'ひだり',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// // Stateを拡張していくよ
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // Scaffoldレイアウト AppBarアプリのタイトルバー
//     return _State();
//   }
// }
