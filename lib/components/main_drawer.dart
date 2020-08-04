import 'dart:io';
import 'package:flutter/material.dart';
import 'package:halopos/business.dart';
import 'package:halopos/data/database_helper.dart';
import 'package:halopos/login.dart';
import 'package:halopos/models/account_model.dart';
import 'package:halopos/report.dart';
import 'package:halopos/settings.dart';
import 'package:halopos/utils/transition.dart';

import '../home.dart';


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  BuildContext _context;

  DatabaseHelper db;
  Account _userSession;
  String _name;

  _MainDrawerState() {
    db = new DatabaseHelper();
  }

  @override
  void initState(){
    _name = "";

    db.getUserSession().then((obj) {
      setState(() {
        _userSession = obj;
        _name = obj.fullName;
      });
    });

    super.initState();
  }

  Future<void> doLogout() async {
    var db = new DatabaseHelper();
    await db.deleteUsers();
    Navigator.pushReplacement(_context, FadeRoute(page: LoginPage()));
  }

  File imageFile;

  Widget _pictureProfile (){
    if(imageFile != null){
      return Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(imageFile),
                fit: BoxFit.cover
            ),
            shape: BoxShape.circle,
          ));
    }
    else{
      return Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_pos.png"),
                fit: BoxFit.cover
            ),
            shape: BoxShape.circle,
          ));
    }
  }
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child:
              Center(
                child: _pictureProfile(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(_name,
                  style: TextStyle(
                      fontFamily: 'BwSurcoBook',
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text('Administrator',
                  style: TextStyle(
                      fontFamily: 'BwSurcoLight',
                      fontSize: 13
                  ),
                  textAlign: TextAlign.center
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
              child: RaisedButton(
                padding: const EdgeInsets.all(10.0),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                ),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  doLogout();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.exit_to_app, color: Colors.white,),
                    SizedBox(width: 8,),
                    Text("Keluar"),
                  ],
                ),
              ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.shopping_basket),
                  SizedBox(width: 8,),
                  Text('Point of Sale'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, FadeRoute(page: HomePage(title: 'Point of Sale')));
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.local_activity),
                  SizedBox(width: 8,),
                  Text('Aktivitas'),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 8,),
                  Text('Inventori'),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.timer),
                  SizedBox(width: 8,),
                  Text('Shift'),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.business),
                  SizedBox(width: 8,),
                  Text('Outlet'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, FadeRoute(page: BusinessPage(title: 'Outlet')));
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.library_books),
                  SizedBox(width: 8,),
                  Text('Laporan'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, FadeRoute(page: reportPage(title: 'Laporan')));
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.settings),
                  SizedBox(width: 8,),
                  Text('Pengaturan'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, FadeRoute(page: settings(title: 'pengaturan',)));
              },
            ),
          ],
        )
    );
  }
}
