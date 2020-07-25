import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haversine/haversine.dart';

import 'bimage.dart';
import 'main.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GoogleMaps Demo',
      theme: ThemeData(
        primaryColor: Colors.blue[300],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=10.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("  Hyderabad -> SCENARIO 1",style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),

      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
      drawer: new AppDrawer(),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Colors.deepOrange),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color:Colors.deepOrange),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(17.3849937,78.4863747), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(17.3849937,78.4863747), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 50.0,
        width: 200.0,
        child: RaisedButton(
            elevation: 5.0,
            color: Colors.blue[300],
            child: Text('SCENARIO 2',style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                return Secondmap();
              }));
            }),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(17.3849937,78.4863747), zoom: 10.5),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          bangaloreMarker,target1,target2,target3,target4,
        },
      ),
    );
  }

} //Home state closure


final lat = 17.3849937;
final lon = 78.4863747;

final lat1= 17.5466401;
final lon1= 78.3660409;

final lat2= 17.2940429;
final lon2=78.3849341;

final lat3= 17.3645242;
final lon3=78.5366504;

final lat4= 17.4243284;
final lon4=78.4850895;

final hav1 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat1,longitude2: lon1);
final hav2 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat2,longitude2: lon2);
final hav3 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat3,longitude2: lon3);
final hav4 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat4,longitude2: lon4);


final ran1= (hav1.distance()/1000).toStringAsFixed(2);
final ran2= (hav2.distance()/1000).toStringAsFixed(2);
final ran3= (hav3.distance()/1000).toStringAsFixed(2);
final ran4= (hav4.distance()/1000).toStringAsFixed(2);



Marker bangaloreMarker = Marker(
    markerId: MarkerId('gramercy'),
    position: LatLng(17.3849937,78.4863747),
    infoWindow: InfoWindow(title: 'RADAR'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    )
);


Marker target1 = Marker(
  markerId: MarkerId('target1'),
  position: LatLng(17.5466401,78.3660409),
  infoWindow: InfoWindow(title: 'TARGET 1',snippet: 'RANGE : $ran1 KM , BEARING : 14.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker target2 = Marker(
  markerId: MarkerId('target2'),
  position: LatLng(17.2940429,78.3849341),
  infoWindow: InfoWindow(title: 'TARGET 2',snippet: 'RANGE : $ran2 KM , BEARING : 38.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker target3 = Marker(
  markerId: MarkerId('target3'),
  position: LatLng(17.3645242,78.5366504),
  infoWindow: InfoWindow(title: 'TARGET 3',snippet: 'RANGE : $ran3 KM , BEARING : 47.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker target4 = Marker(
  markerId: MarkerId('target4'),
  position: LatLng(17.4243284,78.4850895),
  infoWindow: InfoWindow(title: 'TARGET 4',snippet: 'RANGE : $ran4 KM , BEARING : 7.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);


// Second Page

var zoomVal = 10.5;


class Secondmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Hyderabad -> SCENARIO 2",style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap2(context),
          _buildContainer2(context),
        ],
      ),
      drawer: new AppDrawer1(),
    );
  }


  Widget _buildContainer2(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 50.0,
          width: 200.0,
          child: RaisedButton(
              elevation: 5.0,
              color: Colors.blue[300],
              child: Text('SCENARIO 1',style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),),
              onPressed: () {
                Navigator.pop(context);
              })),
    );
  }

  Widget _buildGoogleMap2(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(17.3849937,78.4863747), zoom: 10.5),
        onMapCreated: (GoogleMapController controller) {
        },
        markers: {
          bangaloreMarker,target11,target22,target33,target44,
        },
      ),
    );
  }
}


Marker target11 = Marker(
  markerId: MarkerId('target1'),
  position: LatLng(17.3325914,78.4499654),
  infoWindow: InfoWindow(title: 'TARGET 1',snippet: 'RANGE : $ran11 KM , BEARING : 14.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker target22 = Marker(
  markerId: MarkerId('target2'),
  position: LatLng(17.4534279,78.3920529),
  infoWindow: InfoWindow(title: 'TARGET 2',snippet: 'RANGE : $ran22 KM , BEARING : 29.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker target33 = Marker(
  markerId: MarkerId('target3'),
  position: LatLng(17.4448601,78.4892286),
  infoWindow: InfoWindow(title: 'TARGET 3',snippet: 'RANGE : $ran33 KM , BEARING : 68.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker target44 = Marker(
  markerId: MarkerId('target4'),
  position: LatLng(17.3685962,78.5326828),
  infoWindow: InfoWindow(title: 'TARGET 4',snippet: 'RANGE : $ran44 KM , BEARING : 38.0'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);


final lat11= 17.3325914;
final lon11=78.4499654;

final lat22= 17.4534279;
final lon22=78.3920529;

final lat33= 17.4448601;
final lon33= 78.4892286;

final lat44= 17.3685962;
final lon44= 78.5326828;


final hav11 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat11,longitude2: lon11);
final hav22 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat22,longitude2: lon22);
final hav33 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat33,longitude2: lon33);
final hav44 = new Haversine.fromDegrees(latitude1: lat,longitude1: lon,latitude2: lat44,longitude2: lon44);


final ran11= (hav11.distance()/1000).toStringAsFixed(2);
final ran22= (hav22.distance()/1000).toStringAsFixed(2);
final ran33= (hav33.distance()/1000).toStringAsFixed(2);
final ran44= (hav44.distance()/1000).toStringAsFixed(2);






// TEST CODE



class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}


class AppDrawer1 extends StatefulWidget {
  @override
  _AppDrawerState1 createState() => _AppDrawerState1();
}



class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child:new ListView(

            padding: EdgeInsets.zero,
            children: <Widget>[

              Container(
                height: 300,
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
                                ListTile(
                                    leading:Icon(Icons.menu),
                                    title: new Text('Targets' ,style: TextStyle(fontSize: 20)) ,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          // return object of type Dialog
                                          return AlertDialog(
                                            title: new Text("TARGETS"),
                                            content: new Container(
                                                height:210 ,
                                                margin: const EdgeInsets.all(5.0),
                                                padding: const EdgeInsets.all(3.0),
                                                decoration: new BoxDecoration(
                                                    border: new Border.all(color: Colors.blueAccent)
                                                ),
                                                child:new Column(
                                                    children: <Widget>[
                                                      Table(

                                                          defaultColumnWidth: FixedColumnWidth(80.0),
                                                          border: TableBorder(
                                                            horizontalInside: BorderSide(
                                                              color: Colors.black,
                                                              style: BorderStyle.solid,
                                                              width: 1.0,
                                                            ),
                                                            verticalInside: BorderSide(
                                                              color: Colors.black,
                                                              style: BorderStyle.solid,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          children: [
                                                            TableRow(children: [
                                                              Text("  Target"),
                                                              Text("   Range"),
                                                              Text("   Bearing")
                                                            ]),
                                                            TableRow(children:[
                                                              Text("TARGET 1 "),
                                                              Text("22.08 Km"),
                                                              Text("  14.0")
                                                            ]),
                                                            TableRow(children:[
                                                              Text("TARGET 2 "),
                                                              Text("14.79 Km"),
                                                              Text("  38.0")
                                                            ]),
                                                            TableRow(children:[
                                                              Text("TARGET 3 "),
                                                              Text("  5.81 Km"),
                                                              Text("  47.0")
                                                            ]),
                                                            TableRow(children:[
                                                              Text(" TARGET 4 "),
                                                              Text("  4.38 Km"),
                                                              Text("  7.0")
                                                            ]),
                                                          ])
                                                    ]
                                                )
                                            ),
                                          );
                                        },
                                      );
                                    }
                                ) ,
                                SizedBox(height:300),

                                new MaterialButton(child:new Text("BACK"),onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                    return new Mynew();

                                  }));

                                },color: Colors.blueAccent,height: 40.0,
                                  minWidth: 190.0,),                         ]
                          )
                      )

                  )
              ),
            ]
        )
    );
  }
}


class _AppDrawerState1 extends State<AppDrawer1> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child:new ListView(

            padding: EdgeInsets.zero,
            children: <Widget>[

              Container(
                height: 270,
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
                                ListTile(
                                    leading:Icon(Icons.menu),
                                    title: new Text('Targets' ,style: TextStyle(fontSize: 20)) ,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          // return object of type Dialog
                                          return AlertDialog(
                                            title: new Text("TARGETS"),
                                            content: new Container(
                                                height: 210.0 ,
                                                margin: const EdgeInsets.all(5.0),
                                                padding: const EdgeInsets.all(3.0),
                                                decoration: new BoxDecoration(
                                                    border: new Border.all(color: Colors.blueAccent)
                                                ),
                                                child:new Column(
                                                    children: <Widget>[
                                                      Table(

                                                          defaultColumnWidth: FixedColumnWidth(80.0),
                                                          border: TableBorder(
                                                            horizontalInside: BorderSide(
                                                              color: Colors.black,
                                                              style: BorderStyle.solid,
                                                              width: 1.0,
                                                            ),
                                                            verticalInside: BorderSide(
                                                              color: Colors.black,
                                                              style: BorderStyle.solid,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          children: [
                                                            TableRow(children: [
                                                              Text("  Target"),
                                                              Text("  Range"),
                                                              Text("  Bearing")
                                                            ]),
                                                            TableRow(children:[
                                                              Text(" TARGET 1 "),
                                                              Text("  7.0 Km"),
                                                              Text("  14.0")
                                                            ]),
                                                            TableRow(children:[
                                                              Text(" TARGET 2 "),
                                                              Text("12.59 Km"),
                                                              Text("  29.0")
                                                            ]),
                                                            TableRow(children:[
                                                              Text(" TARGET 3 "),
                                                              Text("  6.67 Km"),
                                                              Text("  68.0")
                                                            ]),
                                                            TableRow(children:[
                                                              Text(" TARGET 4 "),
                                                              Text("  5.25 Km"),
                                                              Text("  38.0")
                                                            ]),
                                                          ])
                                                    ]
                                                )
                                            ),
                                          );
                                        },
                                      );
                                    }
                                ) ,
                                SizedBox(height:300),

                                new MaterialButton(child:new Text("BACK"),onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                    return new Mynew();

                                  }));

                                },
                                  color: Colors.blueAccent,height: 40.0,
                                  minWidth: 190.0,),                         ]
                          )
                      )

                  )
              ),
            ]
        )
    );
  }
}