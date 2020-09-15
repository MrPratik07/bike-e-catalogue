import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Information extends StatefulWidget {
  final String value;
  Information({key,this.value}):super(key:key);
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  @override
  Widget build(BuildContext context) {
    new RaisedButton(
      color: Theme.of(context).buttonColor,
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text("Add to Favrouite",),
      onPressed: (){
        
      },
    );
    if(widget.value==null)
      {
        return Text('Scan the QR code first');
      }
      else {
      return WebviewScaffold(
        //url: 'http://10.0.2.2/Admin_Bar/display.php?id='+widget.value,
        url: widget.value,
        scrollBar: true,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      );
    }
  }
}
