import 'package:flutter/material.dart';
import 'package:halopos/AppBarr.dart';
import 'package:halopos/components/main_drawer.dart';
import 'package:intl/intl.dart';


class reportPage extends StatefulWidget {
  reportPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _reportPageState createState() => _reportPageState();
}

class _reportPageState extends State<reportPage> {
  DateTime _dateTime = new DateTime.now();
@override
  Widget build(BuildContext context) {
  String _formateDate = new DateFormat.yMMMd().format(_dateTime);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: cAppBar(widget.title),
        drawer: MainDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Center(
            child: Wrap(
              children: <Widget>[
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey)),
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.8,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.grey)
                                    )
                                ),
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                          child: Icon (Icons.calendar_today),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                          child: Text (_formateDate == null ? DateTime.now().toString() : _formateDate.toString(), style: TextStyle(fontSize: 16),),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2030))
                                            .then((date) {
                                          setState(() {
                                            if (date != null)
                                              _dateTime = date;
                                            else
                                              _dateTime = DateTime.now();
                                          });
                                        });
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Icon (Icons.edit),
                                          Text("Edit")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.7,
                                child: ListView(
                                  children: <Widget>[

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
