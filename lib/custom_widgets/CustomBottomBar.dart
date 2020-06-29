import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:my_first_mobile_app/custom_icons/car_sales_icons.dart';
// import 'package:my_first_mobile_app/custom_icons/twitter_icons_icons.dart';

class CustomBottomBar extends StatefulWidget {
  final BuildContext context;
  final double heightScrenn;
  final double widthScreen;
  final double
      appBarHeight; //Coeficient que je définit pour calculer la hauteur en fonction de l'ecran
  final double appBarWidth;
  final double appBarIconHeigth;
  final double appBarBorderHeigth; //Hauteur de ma séparation

  CustomBottomBar(
      {@required this.context,
      @required this.heightScrenn,
      @required this.widthScreen,
      this.appBarHeight = 0.09,
      this.appBarWidth = 1,
      this.appBarIconHeigth = 0.04,
      this.appBarBorderHeigth = 0.01});

  @override
  _CustomBottomBar createState() => _CustomBottomBar();
}

class _CustomBottomBar extends State<CustomBottomBar> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  int _curIndex = 0;
  var route;
  Widget buildTopBorder() {
    return Container(
      height: widget.heightScrenn * widget.appBarBorderHeigth,
      width: widget.widthScreen * widget.appBarWidth,
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _curIndex = index;
    });
    switch (_curIndex) {
      case 0:
        print('user1');
        route = Navigator.pushReplacementNamed(this.context, "/home");
        break;
      case 1:
        print('user2');
        break;
      case 2:
        print('user3');
        break;
    }
    return route;
  }

  Widget buildIconsRow() {
    double rowHeight = widget.heightScrenn * widget.appBarHeight -
        widget.heightScrenn * widget.appBarBorderHeigth;
    // double iconSize = widget.heightScrenn * widget.appBarIconHeigth;
    return Container(
      color: Colors.white,
      width: widget.widthScreen * widget.appBarWidth,
      height: rowHeight,
      alignment: Alignment.topCenter,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Annonces'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profil'),
          ),
        ],
        // currentIndex: _selectedIndex,uuuu
        selectedItemColor: Colors.amber[800],
        currentIndex: _curIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightScrenn * widget.appBarHeight,
      width: widget.widthScreen * widget.appBarWidth,
      child: Column(
        children: <Widget>[
          buildTopBorder(),
          buildIconsRow(),
        ],
      ),
    );
  }
}
