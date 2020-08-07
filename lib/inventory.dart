import 'package:flutter/material.dart';
import 'package:halopos/AppBarr.dart';
import 'package:halopos/components/main_drawer.dart';

class inventoryPage extends StatefulWidget {
  final String title;

  const inventoryPage({Key key, this.title}) : super(key: key);
  @override
  _inventoryPageState createState() => _inventoryPageState();
}

class _inventoryPageState extends State<inventoryPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: cAppBar(widget.title),
          drawer: MainDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                child: SizedBox(
                  height: 30,
                  child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Theme.of(context).primaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: <Widget>[
                      Tab(
                        text: "Item",
                      ),
                      Tab(
                        text: "Ingredient",
                      )
                    ],
                  ),
                ),
              ), //TabBar
              Expanded(child: TabBarView(
                children: <Widget>[
                  ItemLibrary(),
                  Icon(Icons.dashboard)
                ],
              ))
            ],
          )
        ),
    );
  }
}

class ItemLibrary extends StatefulWidget {
  @override
  _ItemLibraryState createState() => _ItemLibraryState();
}

class _ItemLibraryState extends State<ItemLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)
                  ),
                  margin: EdgeInsets.all(7),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search,color: Theme.of(context).primaryColor,size: 25,),
                        onPressed: (){},
                      ),
                    ],
                  )
              ),
            ),

          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("ITEM NAME", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("IN STOCK", style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Divider(thickness: 2,),
                      new Expanded(
                        flex: 1,
                        child: ListView(
                          children: <Widget>[
                            InkWell(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey, width: 1))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Image.asset("assets/images/ic_pos.png", height: 40,width: 40,),
                                          SizedBox(width: 10,),
                                          Text("ITEM 1")
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text("10"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

