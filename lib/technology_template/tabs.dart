import 'package:flutter/material.dart';


class Tabs extends StatelessWidget {
  static const String routeName = '/tete';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tete'),
      ),

      body: Center(
        
        child: 
      Column(children: [
        Image.asset('images/flutter_icon.png'),
        Text('tete')

      ],)
        
        
      ),
      
    );
  }
}
