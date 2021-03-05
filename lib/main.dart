// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// アプリの生成するよ宣言
void main() => runApp(MyApp());
// 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Technology collection',
      home: RandomWords(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Technology collection'),
      //   ),
      //   body: Center(
      //     child: RandomWords(),
      //   ),
      // ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 30);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technology collection'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
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
