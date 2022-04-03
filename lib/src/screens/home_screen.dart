import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:untitled/blocks/app_block.dart';
import 'package:untitled/fullreport.dart';
import 'package:untitled/quickreport.dart';
import '../../loginSupport.dart';
import '/login.dart';
import '/fullreport.dart';
import '/quickreport.dart';
import '/src/profile.dart';

class HomeScreeen extends StatefulWidget {
  @override
  _HomeScreeenState createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  GoogleMapController _controller;
  Location _location = Location();
  LatLng _IntialPosition = LatLng(37.42796133580664, -122.085749655962);
  void _onMapCreated(GoogleMapController _cntrl) {
    _controller = _cntrl;
    _location.onLocationChanged().listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Marker _kGooglePlex = Marker(
      markerId: MarkerId('_kGoogle'),
      infoWindow: InfoWindow(title: 'check marker'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(37.42796133580664, -122.085749655962),
    );

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: Text("Repath"),
            flexibleSpace: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0))),
            titleTextStyle: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 24.0,
                fontFamily: 'kung-fu-master-font',
                fontWeight: FontWeight.w100),
            backgroundColor: Colors.transparent,
            elevation: 15,
            leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Color.fromARGB(255, 49, 49, 114),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                }, // omitting onPressed makes the button disabled
              ),
            ), // 1
            // title: null, // 2
            centerTitle: true,
            actions: <Widget>[
              CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 214, 214, 218),
                  radius: 20,
                  child: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/pro');
                      })) // avatar added here
            ] // 3
            ),
        floatingActionButton: SpeedDial(
            icon: Icons.edit,
            label: const Text("Report"),
            backgroundColor: Color.fromARGB(255, 40, 148, 43),
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.text_snippet),
                  label: "Full Report",
                  backgroundColor: Colors.amberAccent,
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Full()),
                      )),
              SpeedDialChild(
                  child: const Icon(Icons.fast_forward),
                  label: "Quick Report",
                  backgroundColor: Colors.amberAccent,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Quick()))),
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Color.fromARGB(255, 199, 221, 199),
        body: Stack(children: <Widget>[
          GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _IntialPosition, zoom: 10),
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: {_kGooglePlex}),
        ]));
  }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled');
//     }

//     permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();

//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permission denied");
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied');
//     }

//     Position position = await Geolocator.getCurrentPosition();

//     return position;
//   }
}
