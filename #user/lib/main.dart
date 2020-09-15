import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_page/signup.dart';
import 'package:home_page/home.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(MyApplication());
class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyApp(),
    );
  }
}
String username='';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();

  String msg='';
  Future<List> _login() async {
    final response = await http.post("http://192.168.43.111/Admin_Bar/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    print(response.body);
    var datauser = json.decode(response.body);


    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
        showDialog<String>(
          context: context,
          builder: (BuildContext context)=>AlertDialog(
            title: Text(msg),
            actions: <Widget>[
              FlatButton(onPressed: (){
                var route=new MaterialPageRoute(
                  builder: (BuildContext Context)=>new MyApp(),
                );
                Navigator.of(context).push(route);
              },
                  child: Text('Login Again'))
            ],
          )
        );
      });


      setState(() {
        username= datauser[0]['username'];
      });

    }
    else {
      setState(() {
        msg = "Login sucess";
        showDialog<String>(
            context: context,
            builder: (BuildContext context)=>AlertDialog(
              title: Text(msg),
              actions: <Widget>[
                FlatButton(onPressed: (){
                  String textToSend = user.text;
                  var route=new MaterialPageRoute(
                    builder: (BuildContext Context)=>new Home(text: textToSend,),
                  );
                  Navigator.of(context).push(route);
                },
                    child: Text('Go Next'))
              ],
            )
        );
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.lightBlue),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/bike_image.png',height: 129.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
                child: TextField(controller: user,decoration: InputDecoration(
                    hintText: "UserName",
                    hintStyle: new TextStyle(color: Colors.white),
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0)
                        )
                    )
                ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                child: TextField(controller: pass,obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: new TextStyle(color: Colors.white),
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)
                          )
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,20.0,0.0,0.0),
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  child: Text("Login"),
                  onPressed: (){
                    _login();
                  },
                ),
              ),
              new InkWell(
                  child: new Text("Register Here",style: new TextStyle(fontSize: 20.0,color: Colors.white,decoration: TextDecoration.underline),),
                  onTap : () {
                    var route=new MaterialPageRoute(
                      builder: (BuildContext Context)=>new App(),
                    );
                    Navigator.of(context).push(route);
                  }
              ),
              //Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}















