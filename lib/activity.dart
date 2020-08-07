import 'package:flutter/material.dart';
import 'package:halopos/AppBarr.dart';
import 'package:halopos/components/main_drawer.dart';

class activityPage extends StatefulWidget {
  final String title;

  const activityPage({Key key, this.title}) : super(key: key);
  @override
  _activityPageState createState() => _activityPageState();
}

class _activityPageState extends State<activityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(widget.title),
      drawer: MainDrawer(),
    );
  }
}
