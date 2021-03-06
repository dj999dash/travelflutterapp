import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  int _selectionIndex =0;
  List<IconData> _icons =[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index){

    return GestureDetector(
      onTap: (){
        setState(() {
          _selectionIndex = index;
        });
        print(_selectionIndex);
      },
      child: Container(
        height:60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectionIndex == index ? Theme.of(context).accentColor : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectionIndex == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 120.0),
              child: Text('What you would like to find ?',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons.asMap().entries.map((MapEntry map) => _buildIcon(map.key),)
              .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
          ],
        ) ,
      ) ,
    );
  }
}