import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map/icon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

var color = [Colors.blue.withOpacity(0.3),Colors.yellow.withOpacity(0.3),Colors.red.withOpacity(0.3)];


Set<Circle> circle = Set.from([
  Circle(
      circleId: CircleId("mandalagan"),
      center: LatLng(10.6855, 122.9748),
      radius: 760,
      fillColor: color[2],
      strokeColor: color[2]),

  Circle(
      circleId: CircleId("taculing"),
      center: LatLng(10.6485, 122.9624),
      radius: 1000,
      fillColor: color[0],
      strokeColor: color[0]),
  Circle(
      circleId: CircleId("brgy19"),
      center: LatLng(10.6694, 122.9533),
      radius: 1000,
      fillColor: color[1],
      strokeColor: color[1]),

]);
class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _bacolod = CameraPosition(
    target: LatLng(10.6840, 122.9563),
    zoom: 14.4746,
  );

  Future navigateToSubPage(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => IconPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _bacolod,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            circles: circle,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  navigateToSubPage(context);
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.black,
                child: const Icon(Icons.map,size: 36.0,),
              ),
            ),
          )
        ]));
  }

}