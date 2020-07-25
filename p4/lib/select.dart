import 'package:flutter/material.dart';

void main() => runApp(new MyApps());
class MyApps extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    Widget fourButtonsSection = new Container(
      width: 600,
      height: 600,
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: new Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          //build in a separated function
          new Text('Select the Radar location',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 31.0, color: Colors.lightBlue[300],fontWeight: FontWeight.bold),),
          SizedBox(height: 80,) ,

          new MaterialButton(
            height: 60.0,
            minWidth: 380.0,
            color: Colors.blue,
            textColor: Colors.white,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.00)),
            child: new Text("Bangalore", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            onPressed: () => {},
            splashColor: Colors.redAccent,

          ),
          SizedBox(height: 20,) ,
          new MaterialButton(
            height: 60.0,
            minWidth: 380.0,
            color: Colors.blue,
            textColor: Colors.white,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.00)),
            child: new Text("Mumbai", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            onPressed: () => {},
            splashColor: Colors.redAccent,
          ) ,
          SizedBox(height: 20,) ,
          new MaterialButton(
            height: 60.0,
            minWidth: 380.0,
            color: Colors.blue,
            textColor: Colors.white,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.00)),
            child: new Text("Delhi", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            onPressed: () => {},
            splashColor: Colors.redAccent,
          )
        ],
      ),
    );

    //build functon returns a "Widget"
    return new MaterialApp(
        title: "",
        home: new Scaffold(
          body:  new ListView(
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors : [
                          Colors.purple[400],
                          Colors.deepPurple[300]

                        ]
                    )
                ),

              ),

              //You can add more widget bellow

              fourButtonsSection,

            ],
          ),


            drawer: new AppDrawer(),
            backgroundColor: Colors.white70,
            appBar: new AppBar(
              backgroundColor: Colors.blue,
              title: new Text('Welcome!'),
              elevation: 40.0,
            ),

        )
    );//Widget with "Material design"
  }
}
class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(

      child:new ListView(
        children: <Widget>[

          new DrawerHeader(child: new Text("User", style: TextStyle(fontSize: 20.0),),),
          new ListTile(
            title:new Text("User Id", style: TextStyle(fontSize: 20.0),),
          )
        ],
      ),
    );
  }
}

