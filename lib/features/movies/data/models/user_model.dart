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
}