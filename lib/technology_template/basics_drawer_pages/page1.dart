import 'package:flutter/material.dart';
import '../drawers.dart';

class Page1 extends StatelessWidget {
  // static const String routeName = '/page1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('sssss'),
      ),
      drawer: Drawers(),
    );
  }
}
