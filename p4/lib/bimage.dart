import 'package:flutter/material.dart';

import 'main.dart';
import 'hyderabad.dart';
import 'banglore.dart';
import 'chennai.dart';


void main() => runApp(Mynew());


class Mynew extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Login'),

    );
  }

}
class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  @override
  Widget build(BuildContext context) {


    final bt1 = Material(

      elevation: 50.0,
      shape: OutlineInputBorder(

          borderRadius: const BorderRadius.all(Radius.circular(25.0)),


          gapPadding: 10.0),


      color: Colors.purple[200],
      child: MaterialButton(

        minWidth: 400,
        padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20),


        highlightElevation: 500,

        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new MyApp1();

          }));

        },
        child: Text("BANGALORE",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
        splashColor: Colors.redAccent,
      ),
    );

    final bt2 = Material(

      elevation: 50.0,
      shape: OutlineInputBorder(

          borderRadius: const BorderRadius.all(Radius.circular(25.0)),


          gapPadding: 10.0),

      color: Colors.purple[200],
      child: MaterialButton(
        minWidth: 400,

        padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20),
        highlightElevation: 500,
        highlightColor: Colors.blue,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new MyApp2();

          }));

        },
        child: Text("HYDERABAD",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
        splashColor: Colors.redAccent,
      ),
    );


    final bt3 = Material(

      elevation: 50.0,

      shape: OutlineInputBorder(

         borderRadius: const BorderRadius.all(Radius.circular(25.0)),


         gapPadding: 10.0),

      color: Colors.purple[200],
      child: MaterialButton(
        splashColor: Colors.redAccent,
        minWidth: 400,
        padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20),
        highlightElevation: 1000,
        highlightColor: Colors.blue,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new MyApp3();

          }));

        },
        child: Text("CHENNAI",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(
appBar: AppBar(
  title: Text("WELCOME!!"),
  backgroundColor: Colors.purple[200],
),

      body: Center(

        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/cl.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(36.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 100.0,
                  child:  tLabels,

                ),

                SizedBox(height: 45.0),
                bt1,
                SizedBox(height: 35.0),
                bt2,
                SizedBox(
                  height: 35.0,
                ),
                bt3,
                SizedBox(
                  height: 15.0,

                ),

              ],
            ),
          ),

        ),
      ),
      drawer: new AppDrawer(),

    );
  }
}
final  tLabels =FlatButton(
    child: Text('SELECT RADAR LOCATION',

      style: style.copyWith(
          color: Colors.black,

          fontWeight: FontWeight.

          bold


      ),

    )

);



class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child:new ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[

          Container(
            height: 350,
            child: new DrawerHeader(
              decoration: BoxDecoration(

            gradient:LinearGradient(
            colors: [
              Colors.blueAccent,
            Colors.purpleAccent
            ]
      )
      ),

              child: Container(



              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Material(
    elevation: 10.0,
    borderRadius: BorderRadius.all(Radius.circular(95)),
    child:

    Padding(padding: EdgeInsets.all(10), child: Image.asset("images/iclogo.png",width:100,height: 100),
    ),

    ),
                Padding(padding: EdgeInsets.all(8),
                  child: Text("ADMIN",style: TextStyle(color: Colors.white,fontSize: 25),),)
    ],
              ),
              )

            ),
          ),
          Container(
              child:new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                      child: Column(
                          children: <Widget>[
                            SizedBox(height:250),
                            new MaterialButton(child:new Text("Log out"),


                              color: Colors.blueAccent,height: 40.0,
                              minWidth: 190.0,
                                onPressed: ()
                                {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                    return new MyApp();

                                  }));

                                }

                                ),
                          ]
                      )
                  )

              )
          ),
        ]
      )
    );
  }
}