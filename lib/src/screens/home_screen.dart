import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/blocks/app_block.dart';
import 'package:untitled/fullreport.dart';
import 'package:untitled/quickreport.dart';
import '/login.dart';
import '/fullreport.dart';
import '/quickreport.dart';
import '/src/profile.dart';

class HomeScreeen extends StatefulWidget {
  @override
  _HomeScreeenState createState() => _HomeScreeenState();
}
class _HomeScreeenState extends State<HomeScreeen> {
  @override
  Widget build(BuildContext context) {
    final appbloc = Provider.of<ApplicationBloc>(context);

    final Marker _kGooglePlex = Marker(
        markerId: MarkerId('_kGoogle'),
        infoWindow: InfoWindow(title:'check marker'),
        icon: BitmapDescriptor.defaultMarker,
        position:  LatLng(37.42796133580664, -122.085749655962),
    );

    return Scaffold(
      appBar: AppBar(
          title: Text("Repath"),
          titleTextStyle: TextStyle(
              color: Color.fromARGB(255, 241, 243, 248),
              fontSize: 24.0,
              fontFamily: 'kung-fu-master-font',
              fontWeight: FontWeight.w100),
          backgroundColor: Color.fromARGB(255, 74, 120, 158),
          leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              }, // omitting onPressed makes the button disabled
            ),
          ), // 1
          // title: null, // 2
          centerTitle: true,
          actions: <Widget>[
            CircleAvatar(
                backgroundColor: Colors.white,
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
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quick()))),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color.fromARGB(255, 199, 221, 199),
      body: (appbloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              //  Container(
              //         width: 200,
              //         height:200,
              //         child: Stack(
              children: [
                //   Align(
                //     alignment:Alignment.topRight,
                //     child: Icon(Icons.access_time)
                //   ),
                //   Container(
                //     width: 200,
                //     height: 200,
                //     child:CircleAvatar(
                //     child:Text('Avatar')
                //     ),
                //   ),

                // ],

                //             ),
                // ),

                Container(
                  height: 725,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers:{_kGooglePlex},
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(appbloc.currentLocation.latitude,
                            appbloc.currentLocation.longitude),
                        zoom: 14),
                  ),
                ),
              ],
            ),
    );
  }

  AppBar _bulidAppBar() {
    return AppBar(
        backgroundColor: Color.fromARGB(255, 197, 250, 217),
        title: Text(
          "repath".toUpperCase(),
          style: TextStyle(fontSize: 19.0, color: Colors.black87),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true);
  }

  // LatLng _center = LatLng(40.762681, -73.832611);
  // FlutterMap _buildMap() {
  //   return FlutterMap(
  //       // options: new MapOptions(
  //       //   minZoom: 15.0,
  //       //   center: _center,
  //       //   interactive: true,
  //       // ),
  //       layers: [
  //         new TileLayerOptions(
  //             urlTemplate: "mapbox://styles/youmoh/cl0pmdt5v002514qzwjvjqeyf",
  //             additionalOptions: {
  //               'accessToken':
  //                   "pk.eyJ1IjoieW91bW9oIiwiYSI6ImNsMHBtODc3MzF6bXQzam5zdWtnMXNoZ3AifQ.2CQp-4dNuNyNB4LT3Om1Cw",
  //               'id': "youmoh"
  //             }),
  //         // new MarkerLayerOptions(markers: _buildMarkersOnMap()),
  //       ]);
  // }
}
