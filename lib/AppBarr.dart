import 'package:flutter/material.dart';

class cAppBar extends StatelessWidget implements PreferredSizeWidget{

  final double _prefferedHeight = 90.0;
  final _title;
  cAppBar(this._title);

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: Container(
          height: 90, width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 13, 8.0, 0),
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



class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height-20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width-20, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height-20);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
