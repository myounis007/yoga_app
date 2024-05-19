import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/auth/login_page.dart';
import 'package:yoga_app/services/profile_service.dart';
import '../models/add_profile_model.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final goalWeightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final picker = ImagePicker();
  File? _imageFile;
  String? _selectedGender;
  final ProfileService _firebaseService = ProfileService();
  UserProfile? userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      userProfile = await _firebaseService
          .getUserProfile(FirebaseAuth.instance.currentUser!.uid);
      if (userProfile != null) {
        setState(() {
          nameController.text = userProfile!.name;
          weightController.text = userProfile!.weight;
          heightController.text = userProfile!.height;
          goalWeightController.text = userProfile!.goalWeight;
          _selectedGender = userProfile!.gender;
          _dateController.text = userProfile!.dateOfBirth;
          // Assuming _imageFile is null since we haven't picked a new image yet
          _imageFile = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load profile: $e')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        String? imageUrl;
        if (_imageFile != null) {
          imageUrl = await _firebaseService.uploadImage(_imageFile!);
        }

        final userProfile = UserProfile(
          id: FirebaseAuth.instance.currentUser!.uid,
          name: nameController.text.trim(),
          weight: weightController.text.trim(),
          height: heightController.text.trim(),
          goalWeight: goalWeightController.text.trim(),
          gender: _selectedGender ?? 'Male',
          dateOfBirth: _dateController.text.trim(),
          imageUrl: imageUrl ?? this.userProfile?.imageUrl ?? '',
        );

        await _firebaseService.saveUserProfile(userProfile);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile saved successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save profile: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please complete all fields and select an image')),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 6.h),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : userProfile?.imageUrl.isNotEmpty == true
                            ? NetworkImage(userProfile!.imageUrl)
                            : null as ImageProvider<Object>?,
                    child: _imageFile == null &&
                            (userProfile == null ||
                                userProfile!.imageUrl.isEmpty)
                        ? const Icon(Icons.add_a_photo, size: 50)
                        : null,
                  ),
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(labelText: 'Enter your name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: weightController,
                  decoration:
                      const InputDecoration(labelText: 'Enter your weight'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: heightController,
                  decoration: const InputDecoration(
                      labelText: 'Enter your height (cm)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: goalWeightController,
                  decoration: const InputDecoration(
                      labelText: 'Enter your goal weight'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your goal weight';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Gender'),
                  items: ['Male', 'Female'].map((gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  readOnly: true,
                  controller: _dateController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today),
                    hintText: 'Date of birth',
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your date of birth';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 4.h),
                ElevatedButton(
                  onPressed: _saveProfile,
                  child: const Text('Save Profile'),
                ),
                SizedBox(height: 2.h),
                TextButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then(
                          (value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              )),
                        );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
