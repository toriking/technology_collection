import 'package:flutter/material.dart';

class IconCollection extends StatelessWidget {
  static const String routeName = '/tete';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [Image.asset('images/flutter_icon.png'), Text('tete')],
      )),
    );
  }
}
