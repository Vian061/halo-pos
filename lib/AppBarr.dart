import 'package:flutter/material.dart';

class cAppBar extends StatelessWidget implements PreferredSizeWidget{

  final double _prefferedHeight = 80.0;
  final _title;
  cAppBar(this._title);

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);


  @override
  Widget build(BuildContext context) {
    if(_title == "Point of Sale"){
      return ClipPath(
        clipper: AppBarClipper(),
        child: Container(
            height: 80, width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: (){Scaffold.of(context).openDrawer();},
                        icon: Icon(Icons.menu),
                        iconSize: 32,
                        color: Colors.white,),
                      SizedBox(width: 5,),
                      Center(
                        child: Text(_title, style: TextStyle(color: Colors.white, fontSize: 20),),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,)),
                  )
                ],
              ),
            )
        ),
      );
    }
    else{
      return ClipPath(
        clipper: AppBarClipper(),
        child: Container(
            height: 80, width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8.0, 0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){Scaffold.of(context).openDrawer();},
                    icon: Icon(Icons.menu),
                    iconSize: 32,
                    color: Colors.white,),
                  SizedBox(width: 5,),
                  Center(
                    child: Text(_title, style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ],
              ),
            )
        ),
      );
    }
  }
}



class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height-30);
    path.quadraticBezierTo(0, size.height, 30, size.height);
    path.lineTo(size.width-30, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height-30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
