import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/add_course_model.dart';
import '../services/add_course_service.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  _AddExerciseScreenState createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _exerciseNameController = TextEditingController();
  final TextEditingController _kaclController = TextEditingController();
  final TextEditingController _exerciseVideoController =
      TextEditingController();
  final TextEditingController _exercisetitleController =
      TextEditingController();
  final TextEditingController _exerciseLengthController =
      TextEditingController();
  final TextEditingController _exerciseDescriptionController =
      TextEditingController();

  Uint8List? _imageBytes;
  String? _selectedGender;
  bool _isBodyShaping = false;
  String? _selectedDay;
  Uuid uuid = const Uuid();

  final picker = ImagePicker();
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
      });
    }
  }

  void _addExercise() async {
    if (_formKey.currentState!.validate()) {
      try {
        final exercise = Exercise(
          id: uuid.v4(),
          gender: _selectedGender ?? 'Male',
          courseName: _exercisetitleController.text,
          isBodyShaping: _isBodyShaping,
          dayName: _selectedDay ?? 'Monday',
          exerciseName: _exerciseNameController.text.trim(),
          exerciseLength: _exerciseLengthController.text.trim(),
          exerciseDescription: _exerciseDescriptionController.text.trim(),
          kacl: int.parse(_kaclController.text),
          imageUrl: await _firebaseService.uploadImage(_imageBytes),
          videoUrl: _exerciseVideoController.text,
        );

        await _firebaseService.addExercise(exercise);

        _exerciseNameController.clear();
        _exerciseLengthController.clear();
        _exerciseDescriptionController.clear();
        setState(() {
          _imageBytes = null;
          _selectedGender = null;
          _isBodyShaping = false;
          _selectedDay = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Exercise added successfully')),
        );
      } catch (e) {
        print('Error adding exercise: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add exercise')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _exercisetitleController,
                  decoration:
                      const InputDecoration(labelText: 'Exercise title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter exercise title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _exerciseNameController,
                  decoration: const InputDecoration(labelText: 'Exercise Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter exercise name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _exerciseLengthController,
                  decoration:
                      const InputDecoration(labelText: 'Exercise Length'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter exercise length';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _kaclController,
                  decoration: const InputDecoration(labelText: 'Kacl'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter kacl';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _exerciseDescriptionController,
                  decoration:
                      const InputDecoration(labelText: 'Exercise Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter exercise description';
                    }
                    return null;
                  },
                ),
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
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isBodyShaping,
                      onChanged: (value) {
                        setState(() {
                          _isBodyShaping = value ?? false;
                        });
                      },
                    ),
                    const Text('Is Body Shaping'),
                  ],
                ),
                DropdownButtonFormField<String>(
                  value: _selectedDay,
                  onChanged: (value) {
                    setState(() {
                      _selectedDay = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Select day'),
                  items: [
                    'Day 1',
                    'Day 2',
                    'Day 3',
                    'Day 4',
                    'Day 5',
                    'Day 6',
                    'Day 8',
                    'Day 9',
                    'Day 10',
                    'Day 11',
                    'Day 12',
                    'Day 13',
                    'Day 14',
                    'Day 15',
                  ].map((day) {
                    return DropdownMenuItem<String>(
                      value: day,
                      child: Text(day),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Select Image'),
                ),
                _imageBytes != null
                    ? Image.memory(
                        _imageBytes!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
                // ElevatedButton(
                //   onPressed: _pickVideo,
                //   child: const Text('Select Video'),
                // ),
                // _videoFile != null
                //     ? Text('Video selected: ${_videoFile!.path}')
                //     : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _exerciseVideoController,
                  decoration:
                      const InputDecoration(labelText: 'Add video link'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter video link';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _addExercise,
                  child: const Text('Add Exercise'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
