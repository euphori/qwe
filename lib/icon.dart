import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IconPage extends StatefulWidget {
  @override
  State<IconPage> createState() => IconPageState();
}


class IconPageState extends State<IconPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _bacolod = CameraPosition(
    target: LatLng(10.6840, 122.9563),
    zoom: 14.4746,
  );

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
          markers: {
                mandalagan,brgy19,taculing
          },
      ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.black,
              child: const Icon(Icons.map,size: 36.0,),
            ),
          ),
        )
    ]));

  }

  Marker mandalagan = Marker(
    markerId: MarkerId("marker1"),
    position: LatLng(10.6855, 122.9748),
    infoWindow: InfoWindow(title:"Assault Cases"),
    icon:BitmapDescriptor.defaultMarker,

  );
  Marker taculing = Marker(
      markerId: MarkerId("marker2"),
    position: LatLng(10.6485, 122.9624),
    infoWindow: InfoWindow(title: "Theft Cases"),
    icon: BitmapDescriptor.defaultMarker,

  );
  Marker brgy19 = Marker(
      markerId: MarkerId("marker3"),
    position: LatLng(10.6694, 122.9533),
    infoWindow: InfoWindow(title: "Rape Cases"),
    icon:BitmapDescriptor.defaultMarker,


  );
}
