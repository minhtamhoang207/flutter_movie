// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class AccountSettingPage extends StatefulWidget {
  final UserProfile user;
  final Function(UserProfile) onSave;
  final VoidCallback onCancel;

  const AccountSettingPage({
    super.key,
    required this.user,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  late UserProfile _currentUser;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _locationController;
  bool isObscurePassword = true;
  final ImagePicker _picker = ImagePicker();

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
      FocusScope.of(context).unfocus();
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (pickedFile != null && mounted) {
        setState(() {
          _currentUser.profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
        );
      }
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primary,
        title: Text('Account Settings',
        style: AppStyles.s18w700.copyWith(color: AppColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: AppColors.primary),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: AppColors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: _currentUser.profileImage != null
                            ? DecorationImage(
                          image: FileImage(_currentUser.profileImage!),
                          fit: BoxFit.cover,
                        )
                            : const DecorationImage(
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2022/12/02/03/34/girl-7630191_640.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _showImagePickerOptions,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: AppColors.white,
                            ),
                            color: AppColors.primary,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: AppColors.white,
                          ),
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
                      onPressed: widget.onCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'cancel',
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
                        widget.onSave(updatedUser);
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
        ),
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
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
            icon: Icon(
              isObscurePassword ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey,
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
          labelStyle: AppStyles.s18w700,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: AppStyles.s16w400.copyWith(color: AppColors.grey),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
