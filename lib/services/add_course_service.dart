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

  Future<List<Exercise>> getExercises() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('exercises').get();
      return snapshot.docs
          .map((doc) => Exercise.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching exercises: $e');
      throw Exception('Failed to fetch exercises');
    }
  }
}
