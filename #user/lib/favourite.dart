import 'package:flutter/material.dart';
class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text("Favourite",style: TextStyle(fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}
