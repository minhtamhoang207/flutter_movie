import 'dart:io';

class UserProfile {
  String name;
  String email;
  String location;
  File? profileImage;
  String password;

  UserProfile({
    required this.name,
    required this.email,
    required this.location,
    this.profileImage,
    required this.password,
  });

  UserProfile copyWith({
    String? name,
    String? email,
    String? password,
    String? location,
    File? profileImage,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      location: location ?? this.location,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}