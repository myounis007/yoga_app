// models/workout.dart
class Workout {
  int workouts;
  int minutes;
  int calories;
  String userId;

  Workout({
    required this.workouts,
    required this.minutes,
    required this.calories,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'workouts': workouts,
      'minutes': minutes,
      'calories': calories,
      'userId': userId,
    };
  }

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      workouts: json['workouts'],
      minutes: json['minutes'],
      calories: json['calories'],
      userId: json['userId'],
    );
  }
}
