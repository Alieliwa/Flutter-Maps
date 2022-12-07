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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: const CameraPosition(
            target: LatLng(30.136738, 31.326208),
            zoom: 19,
          ),
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              myMarkers.add( Marker(markerId: const MarkerId('1'),
                  position: const LatLng(30.136738, 31.326208),
                  infoWindow: InfoWindow(
                    title: 'Ali ELiwa',
                    snippet: 'Welcome every body',
                    onTap:(){
                      print('you clickedb,afllkfmrekafoierjfija');
                    },
                  ) ,
              ),
              );
            },);
          },
          markers: myMarkers,

        ),
      ),
    );
  }
}
