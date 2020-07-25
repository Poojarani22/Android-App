import 'package:flutter/material.dart';

import 'bimage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login UI',
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
        primarySwatch: Colors.blue,
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

  final myController = TextEditingController();
  final myControllers = TextEditingController();


  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  get hintText => null;
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final emailField = TextField(

      controller: myController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

          hintText: "Email",
          prefixIcon: hintText == "Email" ? Icon(Icons.email): Icon(Icons.email),

          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


    final passwordField = TextField(
      controller: myControllers,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: hintText == "Password" ? Icon(Icons.lock): Icon(Icons.lock),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


    final loginButon = Material(

      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if(myController.text == 'abc@gmail.com' && myControllers.text == '12345')
          {
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new Mynew();

            }));

          }
          else
          {

            void _showDialog() {
              // flutter defined function
              showDialog(
                context: context,



                builder: (BuildContext context) {

                  // return object of type Dialog
                  return AlertDialog(

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),



                    content: new Text("Incorrect credentials\n Try Again !",style: TextStyle(color: Colors.black87),),

                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("Close",style: TextStyle(color: Colors.red[900]),),

                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
            _showDialog();
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(


      body: Center(

        child: Container(


          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "images/bel.png",
                      fit: BoxFit.contain,
                    ) ,

                  ),
                  SizedBox(height: 45.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  SizedBox(
                    height: 15.0,

                  ),
                  forgotLabel,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
final emailField = TextField(

  style: style,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

      hintText: "Email",
      border:
      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),



);



final  forgotLabel =FlatButton(
  child: Text('Forgot Password ?',

    style: TextStyle(color: Colors.black26),
  ),

  onPressed: () {},

);

