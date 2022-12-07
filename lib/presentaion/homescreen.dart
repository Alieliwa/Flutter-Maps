import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myMarkers = HashSet<Marker>();
  // late BitmapDescriptor customMarker;

  // getCustomMarker() async {
  //   customMarker = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration.empty, "assets/images/convocation.jpg");
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getCustomMarker();
  // }
  Set<Polygon> myPolygon() {
    List<LatLng> polygonCoords =  [];
    polygonCoords.add(const LatLng(37.43296265331129, -122.08832357078792));
    polygonCoords.add(const LatLng(37.43006265331129, -122.08832357078792));
    polygonCoords.add(const LatLng(37.43006265331129, -122.08332357078792));
    polygonCoords.add(const LatLng(37.43296265331129, -122.08832357078792));

    Set<Polygon> polygonSet =  Set();
    polygonSet.add(Polygon(
        polygonId: const PolygonId('test'),
        points: polygonCoords,
        strokeWidth: 2,
        strokeColor: Colors.red));
    return polygonSet;
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.43296265331129, -122.08832357078792),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            setState(
              () {
                myMarkers.add(
                   const Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.136738, 31.326208),
                    infoWindow: InfoWindow(
                      title: 'Ali ELiwa',
                      snippet: 'Welcome every body',
                    ),
                    // icon: customMarker,
                  ),
                );
              },
            );
          },
          markers: myMarkers,
          polygons: myPolygon(),
        ),
      ),
    );
  }
}
