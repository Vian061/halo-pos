import 'package:flutter/material.dart';
import 'package:halopos/AppBarr.dart';
import 'package:halopos/components/main_drawer.dart';
import 'package:halopos/data/database_helper.dart';
import 'package:halopos/models/account_model.dart';
import 'package:halopos/presenters/updateProfilePresenter.dart';
import 'package:intl/intl.dart';

class updateProfile extends StatefulWidget {
  final String title;

  const updateProfile({Key key, this.title}) : super(key: key);
  @override
  _updateProfileState createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> implements updateProfileContract {
  TextEditingController _namaLengkapController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _dobController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _passwordConfirmController = new TextEditingController();

  DatabaseHelper db;
  Account _userSession;

  _updateProfileState() {
    db = new DatabaseHelper();
    _presenter = new updateProfilePresenter(this);
  }

  final formKey = new GlobalKey<FormState>();

  bool _isLoading = false;

  BuildContext _context;
  updateProfilePresenter _presenter;


  void doUpdate () {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      var request = new Account(
          fullName: _namaLengkapController.text,
          email: _emailController.text,
          dateOfBirth: _dobController.text,
          address: _addressController.text,
          mobile: _addressController.text,
          password: _passwordController.text
      );
      _presenter.doUpdate(request);
    }
  }

  @override
  void initState() {
    db.getUserSession().then((obj) {
      _userSession = obj;
      _namaLengkapController.text = obj.fullName;
      _emailController.text = (obj.email != null ? obj.email : "");
      _addressController.text = (obj.address != null ? obj.address : "");
      _mobileController.text = (obj.mobile != null ? obj.mobile : "");
      _dobController.text = (obj.dateOfBirth != null ? obj.dateOfBirth : "");
    });

    super.initState();
  }

  DateTime _dateTime = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    String _formatDate = new DateFormat.yMMMd().format(_dateTime);

    return Scaffold(
        appBar: cAppBar(widget.title),
        drawer: MainDrawer(),
        body: Builder(
          builder: (BuildContext context){
            _context = context;
            return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Wrap(children: <Widget>[
                    Form(
                      key: formKey,
                      child: Card(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey)),
                          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                          child: new Column(
                            children: <Widget>[
                              new Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, right: 15.0, top: 15.0),
                                  child: Text(
                                    'Update Profile',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 22,
                                        fontFamily: 'CaroselloRegular'),
                                  )),
                              new Padding(
                                padding: EdgeInsets.all(15.0),
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'BwSurcoBook'),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.perm_identity,
                                        color: Colors.grey,
                                        size: 26.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: 'Nama Lengkap',
                                      contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                          top: 0.0,
                                          bottom: 0.0,
                                          right: 20.0)),
                                  controller: _namaLengkapController,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 15.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'BwSurcoBook'),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.grey,
                                        size: 26.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: 'E-mail',
                                      contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 20.0)),
                                  controller: _emailController,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 15.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'BwSurcoBook'),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone_android,
                                        color: Colors.grey,
                                        size: 26.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: 'Nomor HP',
                                      contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 20.0)),
                                  controller: _mobileController,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 15.0),
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'BwSurcoBook'),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.location_city,
                                        color: Colors.grey,
                                        size: 26.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: 'Address',
                                      contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 20.0)),
                                  controller: _addressController,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 15.0),
                                child: TextFormField(
                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2030))
                                        .then((date) {
                                      setState(() {
                                        if (date != null)
                                          _dobController.text = date.toString();
                                        else
                                          _dobController.text = "";
                                      });
                                    });
                                  },
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'BwSurcoBook'),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.calendar_today,
                                        color: Colors.grey,
                                        size: 26.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: 'Birth date',
                                      contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 20.0)),
                                  controller: _dobController,
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 15.0),
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'BwSurcoBook'),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                        size: 26.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: 'Password',
                                      contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 20.0)),
                                  controller: _passwordController,
                                  obscureText: true,
                                  validator: (val) {
                                    return val.length < 6
                                        ? "Password tidak boleh kurang dari 6 character"
                                        : null;
                                  },
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 15.0),
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'BwSurcoBook'),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                        size: 26.0,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: 'Konfirmasi Password',
                                      contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 20.0)),
                                  controller: _passwordConfirmController,
                                  obscureText: true,
                                  validator: (val) {
                                    return val != _passwordController.text
                                        ? "Password tidak sama"
                                        : null;
                                  },
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 10.0),
                                child: new RaisedButton(
                                  padding: const EdgeInsets.all(10.0),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)),
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  onPressed: () {
                                    doUpdate();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.update,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text("Update Profile",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'BwSurcoBook')),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ]),
                ));
          },
        ));
  }

  @override
  void onUpdateError(String msg) {
    final snackBar = new SnackBar(content: new Text("Update gagal"), backgroundColor: Colors.red);
    Scaffold.of(_context).showSnackBar(snackBar);
    setState(() => _isLoading = false);
  }

  @override
  void onUpdateSuccess(ResponseAccount user) {
    final snackBar = new SnackBar(content: new Text("Update Berhasil"), backgroundColor: Colors.red);
    Scaffold.of(_context).showSnackBar(snackBar);
    setState(() => _isLoading = false);
  }
}
