import 'dart:io';
import 'package:flutter/material.dart';
import 'package:halopos/AppBarr.dart';
import 'package:halopos/components/main_drawer.dart';
import 'package:halopos/data/database_helper.dart';
import 'package:halopos/models/account_model.dart';
import 'package:halopos/update_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class settings extends StatefulWidget {
  settings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  DatabaseHelper db;
  Account _userSession;
  String _name, _email, _cellular, _address, _birthdate;

  _settingsState() {
    db = new DatabaseHelper();
  }


  @override
  void initState() {
    _name = _email = _address =_cellular = "";

    db.getUserSession().then((obj) {
      setState(() {
        _userSession = obj;
        _email = obj.email;
        _name = obj.fullName;
        _address = obj.address;
        _birthdate = obj.dateOfBirth;
      });
    });

    super.initState();
  }

  File imageFile;

  _openGalery() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialog (BuildContext context){
    return showDialog(context: context, builder:(BuildContext context){
      return AlertDialog(
        title: Text("Pick a Picture as profile Photo"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Divider(thickness: 2,),
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.photo_album),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Gallary"),
                  ],
                ),
                onTap: (){
                  _openGalery();
                },
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.camera),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Camera"),
                  ],
                ),
                onTap: (){
                  _openCamera();
                },
              ),
            ],
          ),
        ),
      );
    });
  }

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: cAppBar(widget.title),
      drawer: MainDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: Wrap(
            children: <Widget>[
              Center(
                child: Text('Halo POS',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                        fontFamily: 'CaroselloRegular'
                    ),
                    textAlign: TextAlign.center
                ),
              ),
              Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)
                  ),
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  child: new Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                          child: Text('Profile',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 22,
                                fontFamily: 'CaroselloRegular'
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: _pictureProfile(),
                            ),
                            IconButton(
                              onPressed: (){
                                _showDialog(context);
                              },
                              icon: Icon(Icons.edit),
                              iconSize: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.perm_identity,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(_name, style: TextStyle(fontSize: 18, fontFamily: 'BwSurcoBook')),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(_email, style: TextStyle(fontSize: 18, fontFamily: 'BwSurcoBook')),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone_android,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("(800) 466-4411", style: TextStyle(fontSize: 20, fontFamily: 'BwSurcoBook')),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(_address, style: TextStyle(fontSize: 20, fontFamily: 'BwSurcoBook')),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("17-01-1991", style: TextStyle(fontSize: 20, fontFamily: 'BwSurcoBook')),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        child: new RaisedButton(
                          padding: const EdgeInsets.all(10.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)
                          ),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => updateProfile(title: "Update Profile",)));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                child: Text("Edit Profile", style: TextStyle(fontSize: 20, fontFamily: 'BwSurcoBook')),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
