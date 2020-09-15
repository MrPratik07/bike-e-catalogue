import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:home_page/information.dart';
class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String result = "Hello";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        new RaisedButton(
          color: Theme.of(context).buttonColor,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text("Add to Favrouite",),
          onPressed: (){

          },
        );
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = " Camera Permission is Denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = " You pressed Back Button before Scanning Anything";
      });
    } catch (ex) {
      setState(() {
        result = " Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: new InkWell(
        child: new Text(result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold
            ),
          ),
          onTap: (){
          var route=new MaterialPageRoute(
              builder: (BuildContext Context)=>new Information(value: result),
          );
          Navigator.of(context).push(route);
        }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}