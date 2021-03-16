import 'package:flutter/material.dart';
import '../components/enddrawer.dart';
import '../components/drawer.dart';

class NewView1 extends StatelessWidget {
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
        child: Image.asset('images/flutter_icon.png'),
      ),
    );
  }
}
