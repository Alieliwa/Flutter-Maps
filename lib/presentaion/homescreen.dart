import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final Completer<GoogleMapController> _controller = Completer();
  // static final CameraPosition _kGooglePlex =   CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(30.166121, 31.383390),
            zoom: 19,
          ),
          // onMapCreated: (GoogleMapController controller) {
          //   _controller.complete(controller);
          // },
        ),
      ),
    );
  }
}
