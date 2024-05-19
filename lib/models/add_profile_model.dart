// models/user_profile.dart
class UserProfile {
  String id;
  String name;
  String weight;
  String height;
  String goalWeight;
  String gender;
  String dateOfBirth;
  String imageUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.goalWeight,
    required this.gender,
    required this.dateOfBirth,
    required this.imageUrl,
  });

  // Convert a UserProfile into a Map. The keys must correspond to the names of the fields in Firestore.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'weight': weight,
      'height': height,
      'goalWeight': goalWeight,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'imageUrl': imageUrl,
    };
  }

  // Create a UserProfile from a Map (Firestore document)
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      weight: json['weight'],
      height: json['height'],
      goalWeight: json['goalWeight'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      imageUrl: json['imageUrl'],
    );
  }
}
