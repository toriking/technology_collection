// コメント多いですが自分なりの解釈です
// 使いたいパッケージを呼ぶよ
import 'package:flutter/material.dart';
import 'package:technology_collection/technology_template/tete.dart';
// 外部ファイルを使うよ
import './technology_template/tete.dart';

// アプリを起動するよ
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
      routes: {
        // '/second': (BuildContext context) => secondPage(),
        '/tete': (BuildContext context) => NewView1(),
      },
      home: Scaffold(
          appBar: AppBar(
            title: Text('Technology collection'),
          ),

          //
          body: MyHomePage(),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // アカウントレイアウト
                UserAccountsDrawerHeader(
                  margin: const EdgeInsets.only(bottom: 0),
                  accountName: Text('Torii'),
                  accountEmail: Text('22321@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
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
          ),
          endDrawer: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    child: DrawerHeader(
                      margin: const EdgeInsets.only(bottom: 0),
                      // padding: EdgeInsets.zero,
                      child: Text(
                        '学習リスト',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'ひだり',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          )),
      // リンク先
    );
  }
}

// homeプロパティのRandmWordsはStatefulWigidetクラスを継承します アプリの状態Stateを扱う
class MyHomePage extends StatefulWidget {
  @override
  // createState関数でホーム画面で扱うStateを指定
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<MyHomePage> {
  
}

// // Stateを拡張していくよ
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // Scaffoldレイアウト AppBarアプリのタイトルバー
//     return _State();
//   }
// }


