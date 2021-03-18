import 'package:flutter/material.dart';
import '../components/drawer.dart';

class Tete extends StatelessWidget {
  static const String routeName = '/tete';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tete'),
      ),
      drawer: TechnologyDrawer(),
      endDrawer: TechnologyEndDrawer(),
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
