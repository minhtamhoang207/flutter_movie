// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class AccountSettingPage extends StatefulWidget {
  final UserProfile user;

  const AccountSettingPage({
    super.key,
    required this.user,
  });

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  late UserProfile _currentUser;
  final ImagePicker _picker = ImagePicker();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _locationController;
  bool isObscurePassword = true;

  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
    _nameController = TextEditingController(text: _currentUser.name);
    _emailController = TextEditingController(text: _currentUser.email);
    _passwordController = TextEditingController(text: _currentUser.password);
    _locationController = TextEditingController(text: _currentUser.location);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _locationController.dispose();
    super.dispose();
  }


  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 70);
      if (pickedFile != null) {
        setState(() {
          _currentUser = _currentUser.copyWith(profileImage: File(pickedFile.path));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatar = _currentUser.profileImage != null
        ? FileImage(_currentUser.profileImage!)
        : const NetworkImage(
      'https://cdn.pixabay.com/photo/2022/12/02/03/34/girl-7630191_640.jpg',
    ) as ImageProvider;
    return Scaffold(
      backgroundColor: AppColors.scaffold_background,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.grey),
        backgroundColor: AppColors.scaffold_background,
        title: Text('Account Settings',
        style: AppStyles.s18w700.copyWith(color: AppColors.primary),),
      ),
      body:
      ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(radius: 70, backgroundImage: avatar),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: _showImagePickerOptions,
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.edit, color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

              const SizedBox(height: 30),
              _buildTextField(_nameController, 'Name', false),
              _buildTextField(_emailController, 'Email', false),
              _buildTextField(_passwordController, 'Password', true),
              _buildTextField(_locationController, 'Location', false),
              const SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: AppStyles.s16w400.copyWith(color: AppColors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final updatedUser = UserProfile(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          location: _locationController.text,
                          profileImage: _currentUser.profileImage,
                        );
                        Navigator.pop(context, updatedUser);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: AppStyles.s16w400.copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label,
      bool isPasswordTextField,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        controller: controller,
        cursorColor: AppColors.primary,
        style: AppStyles.s16w400.copyWith(color: AppColors.grey_light),
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
            icon: Icon(
              isObscurePassword ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primary,
            ),
            onPressed: () {
              setState(() {
                isObscurePassword = !isObscurePassword;
              });
            },
          )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: label,
          labelStyle: AppStyles.s18w700.copyWith(color: AppColors.primary),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: AppStyles.s16w400.copyWith(color: AppColors.white),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
      ),
    );
  }
}
