// import 'package:flutter/material.dart';


// class TechnologyDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           // アカウントレイアウトWidget
//           UserAccountsDrawerHeader(
            
//             margin: const EdgeInsets.only(bottom: 0),
//             accountName: Text('Torii'),
//             accountEmail: Text('22321@gmail.com'),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
//                   ? Colors.blue
//                   : Colors.white,
//               child: Text(
//                 '',
//                 style: TextStyle(fontSize: 40.0),
//               ),
//             ),
//             otherAccountsPictures: [
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//               ),
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//               ),
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//               ),
//             ],
//           ),

//           // 一覧 titleタイトル subtitleサブタイトル titleColor色 leading前端 trailing後端 onTapタップ時イベント

//           ListTile(
//             title: Text('使いたい技術リスト'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TechnologyEndDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           ListTile(
//             title: Text(
//               '技術リスト',
//               textAlign: TextAlign.center,
//             ),
//           ),
//           ListTile(
//             title: Text(
//               'ホーム',
//               style: TextStyle(fontSize: 16, color: Colors.red),
//             ),
//             // tileColor: Colors.black,
//             leading: Icon(Icons.home),
//             trailing: Icon(Icons.arrow_forward),
//             onTap: () {
//               Navigator.of(context).pop();
//               Navigator.of(context).pushReplacementNamed(Routes.home);
//             },
//           ),
//           ListTile(
//             title: Text(
//               'Flutterチュートリアル',
//               style: TextStyle(fontSize: 16, color: Colors.red),
//             ),
//             subtitle: Text('part1,2'),
//             // tileColor: Colors.black,
//             leading: Icon(Icons.list_alt),
//             trailing: Icon(Icons.arrow_forward),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.account_circle),
//             title: Text('その他'),
//             onTap: () {
//               // タップ時にDrawer閉じる
//               // Navigator.of(context).pop();
//               // Navigator.of(context).pushNamed('/second');
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.emoji_objects_outlined),
//             trailing: Icon(Icons.arrow_forward),
//             title: Text('tete'),
//             onTap: () {
//               Navigator.of(context).pop();
//               Navigator.of(context).pushReplacementNamed(Routes.tete);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
