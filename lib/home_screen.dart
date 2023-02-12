import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
        CameraPosition(target: LatLng(18.47653, 73.82057), zoom: 14.7);

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(18.47653, 73.82057),
      infoWindow: InfoWindow(
        title: 'My Location'
      )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(18.49653, 73.90),
        infoWindow: InfoWindow(
            title: 'My 2nd Location'
        )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: Text("Map View"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(18.479, 73.82557),
                        zoom: 16.0
                )
              )
            );
            setState(() {

            });
          },
          child: Icon(Icons.location_disabled_outlined),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    // heightFactor: 0.3,
                    // heightFactor: 1,
                    // widthFactor: 2.5,
                    child: GoogleMap(
                      markers: Set<Marker>.of(_list),
                      initialCameraPosition: _kGooglePlex,
                      mapType: MapType.normal,
                      // compassEnabled: false,
                      onMapCreated: (GoogleMapController controller){
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20.0)
          ],
        ));
  }
}
