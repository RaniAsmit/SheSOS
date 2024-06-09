// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:fluttercontactpicker/fluttercontactpicker.dart'; // Import contact picker plugin
// import 'package:share_plus/share_plus.dart';

// class SafeHome extends StatelessWidget {
//   Future<void> _shareLocation(String? phoneNumber) async {
//     if (phoneNumber == null) return;

//     Location location = Location();
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         // Handle if location services are not enabled
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         // Handle if permission is not granted
//         return;
//       }
//     }

//     _locationData = await location.getLocation();
//     String latitude = _locationData.latitude.toString();
//     String longitude = _locationData.longitude.toString();
//     String message =
//         'My current location is: https://maps.google.com/?q=$latitude,$longitude';

//     // Share the location via share package
//     Share.share(message,
//         subject: 'My Location', sharePositionOrigin: Rect.zero);
//   }

//   Future<String?> _pickContact(BuildContext context) async {
//     final Contact? contact = await FlutterContactPicker.pickPhoneContact();

//     if (contact != null) {
//       if (contact.call()) ;
//     }
//   }

//   showModelSafeHome(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           height: MediaQuery.of(context).size.height / 1.4,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         // String? phoneNumber = await _pickContact(context); // Pick a contact
//         // if (phoneNumber != null) {
//         //   _shareLocation(phoneNumber); // Share location with the selected contact
//         // }
//       },
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Container(
//           height: 180,
//           width: MediaQuery.of(context).size.width * 0.7,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 223, 211, 102),
//                 Color.fromARGB(255, 221, 88, 88),
//               ],
//             ),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ListTile(
//                       title: Text(
//                         "Share Location",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                       subtitle: Text(
//                         "Share current Location",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
