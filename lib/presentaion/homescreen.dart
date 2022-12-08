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
  List<Polyline> myPolyLine = [];
  late GoogleMapController mapController;


  // getCustomMarker() async {
  //   customMarker = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration.empty, "assets/images/convocation.jpg");
  // }

  @override
  void initState() {
    super.initState();
    createPolyLine();
    // _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
    //     BitmapDescriptor.defaultMarker);
    //
    // /// destination marker
    // _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
    //     BitmapDescriptor.defaultMarkerWithHue(90));
    // _getPolyline();
    // getCustomMarker();
  }
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
  Set<Circle> circles = { const Circle(
    circleId: CircleId("1"),
    strokeColor: Colors.blue,
    strokeWidth: 5,
    center: LatLng(37.43296265331129, -122.08832357078792),
    // fillColor: Colors.black,
    radius: 400,
  )};

  createPolyLine(){
    myPolyLine.add( Polyline(
      polylineId: PolylineId('1'),
      color: Colors.red,
      width: 3,
      points: [
        LatLng(29.990000, 31.149000),
        LatLng(29.999000, 31.149900),
      ],
      patterns: [
        PatternItem.dash(20.0),
        PatternItem.gap(10.0),

      ]
    )
    );

  }

  // List<PointLatLng> result = polylinePoints.decodePolyline("_p~iF~ps|U_ulLnnqC_mqNvxq`@");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          myLocationEnabled: true,
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          initialCameraPosition:  CameraPosition(
            target: LatLng(29.990000, 31.149000),
            zoom: 15,
          ),
          onMapCreated:(GoogleMapController controller){
            mapController = controller;
          },
          polylines: myPolyLine.toSet(),
          //     (GoogleMapController controller) {
          //   setState(
          //     () {
          //       myMarkers.add(
          //          const Marker(
          //           markerId: MarkerId('1'),
          //           position: LatLng(30.136738, 31.326208),
          //           infoWindow: InfoWindow(
          //             title: 'Ali ELiwa',
          //             snippet: 'Welcome every body',
          //           ),
          //           // icon: customMarker,
          //         ),
          //       );
          //     },
          //   );
          // },
          onCameraMove: null,

          // circles: circles,
          // markers: myMarkers,
          // polygons: myPolygon(),
        ),
      ),
    );
  }
  // void _onMapCreated(GoogleMapController controller) async {
  //   mapController = controller;
  // }
  //
  // _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
  //   MarkerId markerId = MarkerId(id);
  //   Marker marker =
  //   Marker(markerId: markerId, icon: descriptor, position: position);
  //   markers[markerId] = marker;
  // }
  //
  // _addPolyLine() {
  //   PolylineId id = PolylineId("poly");
  //   Polyline polyline = Polyline(
  //       polylineId: id, color: Colors.red, points: polylineCoordinates);
  //   polylines[id] = polyline;
  //   setState(() {});
  // }
  //
  // _getPolyline() async {
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       googleAPiKey,
  //       PointLatLng(_originLatitude, _originLongitude),
  //       PointLatLng(_destLatitude, _destLongitude),
  //       travelMode: TravelMode.driving,
  //       wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }
  //   _addPolyLine();
  // }
}
