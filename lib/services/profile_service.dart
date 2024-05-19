// services/firebase_service.dart
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../models/add_profile_model.dart';

class ProfileService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadImage(File imageFile) async {
    try {
      final String fileName = Uuid().v4();
      final Reference storageRef =
          _storage.ref().child('profile_images/$fileName');
      await storageRef.putFile(imageFile);
      final String imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  Future<void> saveUserProfile(UserProfile userProfile) async {
    try {
      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userProfile.toJson());
    } catch (e) {
      throw Exception('Error saving user profile: $e');
    }
  }

  Future<UserProfile?> getUserProfile(String userId) async {
    try {
      final docSnapshot =
          await _firestore.collection('users').doc(userId).get();
      if (docSnapshot.exists) {
        return UserProfile.fromJson(docSnapshot.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Error fetching user profile: $e');
    }
  }
}
