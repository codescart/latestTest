// // import 'dart:convert';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
//
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MapScreen(),
// //     );
// //   }
// // }
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   List<MapData> apiData = []; // Replace MapData with your data model class
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     final response = await http.get(
//         Uri.parse('https://sethstore.com/kkisan/mapget_copy.php?predate=2023-08-15&nextdate=2023-08-17&imei=350612074501725'),
//     );
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       setState(() {
//         apiData = parseData(jsonData);
//       });
//     }
//   }
//
//   List<MapData> parseData(dynamic jsonData) {
//     // Parse your data here and return a List of MapData objects
//   }
//
//   Set<Marker> createMarkers() {
//     return apiData.map((data) {
//       return Marker(
//         markerId: MarkerId(data.index.toString()),
//         position: LatLng(data.latitude, data.longitude),
//         icon: BitmapDescriptor.defaultMarkerWithHue(
//           data.ignition ? BitmapDescriptor.hueGreen : BitmapDescriptor.hueRed,
//         ),
//       );
//     }).toSet();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Data on Map'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(0, 0),
//           zoom: 10,
//         ),
//         markers: createMarkers(),
//       ),
//     );
//   }
// }
//
// class MapData {
//   final int index;
//   final bool ignition;
//   final double latitude;
//   final double longitude;
//
//   MapData({
//     required this.index,
//     required this.ignition,
//     required this.latitude,
//     required this.longitude,
//   });
// }
