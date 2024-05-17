import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/add_course_model.dart';

class FirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExercise(Exercise exercise) async {
    try {
      await _firestore.collection('exercises').add(exercise.toJson());
    } catch (e) {
      print('Error adding exercise: $e');
      throw Exception('Failed to add exercise');
    }
  }

  Future<String?> uploadImage(Uint8List? imageBytes) async {
    if (imageBytes == null) return null;

    try {
      final String imageFileName = '${Uuid().v4()}.jpg';
      final Reference storageRef =
          _storage.ref().child('course_images/$imageFileName');

      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
      );
      await storageRef.putData(imageBytes, metadata);

      final String imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // Future<String> uploadVideo(File videoFile) async {
  //   try {
  //     String fileName =
  //         DateTime.now().millisecondsSinceEpoch.toString(); // Unique file name
  //     TaskSnapshot snapshot =
  //         await _storage.ref('videos/$fileName').putFile(videoFile);
  //     if (snapshot.state == TaskState.success) {
  //       final String downloadUrl = await snapshot.ref.getDownloadURL();
  //       return downloadUrl;
  //     } else {
  //       throw 'Failed to upload video';
  //     }
  //   } catch (e) {
  //     print('Error uploading video: $e');
  //     throw e; // Rethrow the error to handle it in the calling function
  //   }
  // }
}
