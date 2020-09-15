import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_page/main.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Application(),
    );
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  String msg='';

  TextEditingController username=new TextEditingController();
  TextEditingController password=new TextEditingController();
  TextEditingController confirm=new TextEditingController();

//  void showToast(String msg){
//    Fluttertoast.showToast(msg: msg,toastLength: Toast.LENGTH_LONG);
//  }

  void register(){
    if(password.text==confirm.text){
      var url="http://192.168.43.111/Admin_Bar/register.php";
      http.post(url,body: {
        "username" : username.text,
        "password" : password.text,
      });
      setState(() {
        msg="Register Sucessful";
        //showToast(msg);
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
                    child: Text('Go To Login'))
              ],
            )
        );
      });
    }
      else{
        setState(() {
          msg="Password does not match";
          //showToast(msg);
          showDialog<String>(
              context: context,
              builder: (BuildContext context)=>AlertDialog(
                title: Text(msg),
                actions: <Widget>[
                  FlatButton(onPressed: (){
                    var route=new MaterialPageRoute(
                      builder: (BuildContext Context)=>new Application(),
                    );
                    Navigator.of(context).push(route);
                  },
                      child: Text('Type Same Password'))
                ],
              )
          );
        });
    }
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
              new Text("Register",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 40.0,color: Colors.white),),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
                child: TextField(controller: username,decoration: InputDecoration(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
                child: TextField(controller: password,obscureText: true,
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
              Padding(padding: EdgeInsets.all(10.0)),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                child: TextField(controller: confirm,obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
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
                  child: Text("Register",),
                  onPressed: (){
                    register();
                  },
                ),
              ),
              new InkWell(
                  child: new Text("Login Here",style: new TextStyle(fontSize: 20.0,color: Colors.white,decoration: TextDecoration.underline),),
                  onTap : () {
                    var route=new MaterialPageRoute(
                      builder: (BuildContext Context)=>new MyApp(),
                    );
                    Navigator.of(context).push(route);
                  }
              ),
              //Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}

