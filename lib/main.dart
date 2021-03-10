// コメント多いですが自分なりの解釈です
// 使いたいパッケージを呼ぶよ
import 'package:flutter/material.dart';
// import './technology_template/tutorial.dart';

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
      home: RandomWords(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // リンク先
      routes: {
        '/first': (BuildContext context) => RandomWords(),
        '/second': (BuildContext context) => secondPage(),
      },
    );
  }
}

// homeプロパティのRandmWordsはStatefulWigidetクラスを継承します アプリの状態Stateを扱う
class RandomWords extends StatefulWidget {
  @override
  // createState関数でホーム画面で扱うStateを指定
  _RandomWordsState createState() => _RandomWordsState();
}

// Stateを拡張していくよ
class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // Scaffoldレイアウト AppBarアプリのタイトルバー
    return Scaffold(
      appBar: AppBar(
        title: Text('Technology collection'),
      ),
      endDrawer: Drawer(
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
              title: Text(
                'Flutterチュートリアル',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              subtitle: Text('part1,2'),
              tileColor: Colors.blue,
              leading: Icon(Icons.list_alt),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushNamed('/first');
              },
              onLongPress: () => {},
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('その他'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/second');
              },
            )
          ],
        ),
      ),
    );
  }
}

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2ページ目'),
      ),
      body: Center(),
    );
  }
}
