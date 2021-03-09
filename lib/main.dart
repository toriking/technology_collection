// コメント多いですが自分なりの解釈です
// 使いたいパッケージを呼ぶよ
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
  // final定義
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 30);
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
              title: Text('Flutterチュートリアル'),
              subtitle: Text('ステージ1'),
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
                Navigator.of(context).pushNamed('/second');
              },
            )
          ],
        ),
      ),

      // アクションボタンonPressddタッチした時のイベント_pushSavedをインクリメント
      // actions: <Widget>[
      //   IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
      // ],

      // body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(14));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.yellow : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map(
        (WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('technology collection'),
        ),
        body: ListView(children: divided),
      );
    }));
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
// class RandomWords extends StatefulWidget {
//   @override
//   RandomWordsState createState() => RandomWordsSatate();
// }
//
// class _RandomWordsState extends State<RandomWords> {
//     @override
//   Widget build(BuildContext content){
//       final wordPair = WordPair.random();
//       return Text(wordPair.asPascalCase)
//   }
//   }
