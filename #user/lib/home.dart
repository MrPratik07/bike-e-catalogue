import 'package:flutter/material.dart';
import './scanner.dart' as scanner;
import './information.dart' as information;
import './favourite.dart' as favourite;
import './about.dart';
import './contact.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Home",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  final String text;
  Home({Key key, @required this.text}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(text);
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController controller;
  String text1;
  _HomeState(String text){
    text1=text;
  }
  @override
  void initState() {
    controller=new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bike e-Catlogue"),
      bottom: TabBar(
        controller: controller,
        tabs: <Widget>[
          Tab(icon: Icon(Icons.scanner),text: "Scanner",),
          Tab(icon: Icon(Icons.info),text: "Information",),
          Tab(icon: Icon(Icons.favorite),text: "Favourite",)
        ],
      ),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountEmail: new Text(text1),),
            new ListTile(
              title: new Text('About Us'),
              onTap: (){
                Navigator.of(context).pop();
                    Navigator.push(context,new MaterialPageRoute(builder:(BuildContext context)=>new aboutpage())
                );
              },
            ),
            new ListTile(
              title: new Text('Contact us'),
              onTap:() {
                Navigator.of(context).pop();
                Navigator.push(context,new MaterialPageRoute(builder:(BuildContext context)=>new contactpage())
                );
              },
            ),
            new RaisedButton(
              child: const Text('logout'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                // Perform some action
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          scanner.Scanner(),
          information.Information(),
          favourite.Favourite(),
        ],
      ),
    );
  }
}
