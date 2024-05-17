class Exercise {
  final String id;
  final String gender;
  final String courseName;
  final bool isBodyShaping;
  final String dayName;
  final String exerciseName;
  final String exerciseLength;
  final String exerciseDescription;
  final int kacl;
  final String? imageUrl;
  final String? videoUrl;

  Exercise({
    required this.id,
    required this.gender,
    required this.courseName,
    required this.isBodyShaping,
    required this.dayName,
    required this.exerciseName,
    required this.exerciseLength,
    required this.exerciseDescription,
    required this.kacl,
    this.imageUrl,
    this.videoUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      courseName: json['course_name'] ?? '',
      isBodyShaping: json['is_body_shaping'] ?? false,
      dayName: json['day_name'] ?? '',
      exerciseName: json['exercise_name'] ?? '',
      exerciseLength: json['exercise_length'] ?? '',
      kacl: json['kacl'] ?? 0,
      imageUrl: json['image_url'],
      videoUrl: json['video_url'],
      exerciseDescription: json['exerciseDescription'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'is_body_shaping': isBodyShaping,
      'day_name': dayName,
      'exercise_name': exerciseName,
      'exercise_length': exerciseLength,
      'kacl': kacl,
      'image_url': imageUrl,
      'video_url': videoUrl,
      'exerciseDescription': exerciseDescription,
      'gender': gender,
    };
  }
}
