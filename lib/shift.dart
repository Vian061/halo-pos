import 'package:flutter/material.dart';
import 'package:halopos/AppBarr.dart';
import 'package:halopos/components/main_drawer.dart';

class shiftPage extends StatefulWidget {
  final String title;

  const shiftPage({Key key, this.title}) : super(key: key);
  @override
  _shiftPageState createState() => _shiftPageState();
}

class _shiftPageState extends State<shiftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(widget.title),
      drawer: MainDrawer(),
    );
  }
}
