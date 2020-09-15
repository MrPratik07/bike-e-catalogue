import 'package:flutter/material.dart';
class aboutpage extends StatefulWidget {
  @override
  _aboutpageState createState() =>new  _aboutpageState();
}

class _aboutpageState extends State<aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('About us'),
      ),
      body: Center(
        child: Text("Bike Catalogue is specially Designed to get the information about the Bikes/Scooters by Virtually visiting the Showroom Our Application Provides All the information About the Bikes,bike images,bike Engine,Bike colour,etc"),
      ),


    );
  }
}
