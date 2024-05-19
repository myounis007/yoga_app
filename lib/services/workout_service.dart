import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout_model.dart';

class WorkoutService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveWorkout(Workout workout) async {
    try {
      await _firestore
          .collection('workouts')
          .doc(workout.userId)
          .set(workout.toJson());
    } catch (e) {
      throw Exception('Failed to save workout: $e');
    }
  }

  Future<Workout?> getWorkout(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('workouts').doc(userId).get();
      if (snapshot.exists) {
        return Workout.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to retrieve workout: $e');
    }
  }

  Future<List<Workout>> getWorkoutsByUserId(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('workouts')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs.map((doc) => Workout.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to retrieve workouts: $e');
    }
  }
}
