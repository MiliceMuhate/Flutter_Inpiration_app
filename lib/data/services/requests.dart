// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart'; // Import for storage functionality
// import 'package:inspirationapp/firebase_options.dart';

// Future<Image?> getImage() async {
//   // Ensure Firebase is initialized before using storage
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   final String imagePath = 'images/profile_picture.jpg';
//   final Reference storageRef = FirebaseStorage.instance.ref().child(imagePath);

//   try {
//     final String downloadUrl = await storageRef.getDownloadURL();
//     return Image.network(downloadUrl); // Update state with Image
//   } catch (error) {
//     // Handle errors appropriately, e.g., display an error message
//     print('Error fetching image: $error');
//   }
// }


