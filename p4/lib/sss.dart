import 'package:flutter/material.dart';


void main() => runApp(new QuoteApp());
class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Motivational Quote App',
      home: new Scaffold(
          body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('images/cl.png'),
                    fit: BoxFit.cover,

                  ),
                ),
              ),
new Center(
  child: new Text ('pooja'),
),

            ],
          )),
    );
  }

}


