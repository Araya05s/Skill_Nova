import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/mission.dart';

final _formKey = GlobalKey<FormState>();

class AddMissionScreen extends StatefulWidget {
  const AddMissionScreen({super.key, this.mission});

  final Mission? mission;

  @override
  State<AddMissionScreen> createState() => _AddMissionScreenState();
}

class _AddMissionScreenState extends State<AddMissionScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _imagePathController;
  
  late final TextEditingController _courseMaterialsCountController;
  late final TextEditingController _xpRewardController;

  late final TextEditingController _durationDaysController;
  late final TextEditingController _durationHoursController;
  late final TextEditingController _durationMinutesController;
  late final TextEditingController _durationSecondsController;

  File? _selectedImage;
  int? _selectedCourseCategoryId;
  List<DropdownMenuItem<int>> _courseCategoryItems = [];
  bool? _isActive = true;

  Future<void> fetchCourseCategories() async {
    final courseCategories = await SkillNovaDatabase.instance.readAllCourseCategories();

    setState(() {
      _courseCategoryItems = courseCategories.map((courseCategory) {
        return DropdownMenuItem<int>(
          value: courseCategory.id,
          child: Text(courseCategory.title),
        );
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    _selectedImage = widget.mission?.image != null ? File(widget.mission!.image) : null;
    _titleController = TextEditingController(text: widget.mission?.title ?? '');
    _imagePathController =
        TextEditingController(text: widget.mission?.image ?? '');
    _courseMaterialsCountController = TextEditingController(
        text: widget.mission?.courseMaterialsCount.toString() ?? '');
    _xpRewardController =
        TextEditingController(text: widget.mission?.xpReward.toString() ?? '');
    _durationDaysController = TextEditingController(
        text: widget.mission?.duration.inDays.toString() ?? '');
    _durationHoursController = TextEditingController(
        text: widget.mission?.duration.inHours.remainder(24).toString() ?? '');
    _durationMinutesController = TextEditingController(
        text:
            widget.mission?.duration.inMinutes.remainder(60).toString() ?? '');
    _durationSecondsController = TextEditingController(
        text:
            widget.mission?.duration.inSeconds.remainder(60).toString() ?? '');
    _selectedCourseCategoryId = widget.mission?.categoryId;
    _isActive = widget.mission?.isActive ?? true;
    fetchCourseCategories();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imagePathController.dispose();
    _courseMaterialsCountController.dispose();
    _xpRewardController.dispose();
    _durationDaysController.dispose();
    _durationHoursController.dispose();
    _durationMinutesController.dispose();
    _durationSecondsController.dispose();
    super.dispose();
  }

  Future<void> _pickAndCopyImage() async {
    final FilePicker filePicker = FilePicker.platform;
    FilePickerResult? result = await filePicker.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      if (_selectedImage != null && await _selectedImage!.exists()) {
        await _selectedImage!.delete(recursive: true);
      }
      final File originalFile = File(result.files.single.path!);
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;

      final String newFilePath = '$appDocPath/${result.files.single.name}';
      await originalFile.copy(newFilePath);

      if (await originalFile.exists()) {
        await filePicker.clearTemporaryFiles();
      }

      setState(() {
        _imagePathController.text = newFilePath;
        _selectedImage = File(_imagePathController.text);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Image file selection cancelled for this mission.')),
      );
    }
  }

  Future<void> addMission() async {
    final mission = Mission(
      title: _titleController.text,
      categoryId: _selectedCourseCategoryId ?? 0,
      image: _imagePathController.text,
      courseMaterialsCount: int.parse(
          _courseMaterialsCountController.text.isEmpty
              ? '0'
              : _courseMaterialsCountController.text),
      xpReward: int.parse(
          _xpRewardController.text.isEmpty ? '0' : _xpRewardController.text),
      duration: Duration(
        days: int.parse(_durationDaysController.text.isEmpty
            ? '0'
            : _durationDaysController.text),
        hours: int.parse(_durationHoursController.text.isEmpty
            ? '0'
            : _durationHoursController.text),
        minutes: int.parse(_durationMinutesController.text.isEmpty
            ? '0'
            : _durationMinutesController.text),
        seconds: int.parse(_durationSecondsController.text.isEmpty
            ? '0'
            : _durationSecondsController.text),
      ),
      isActive: _isActive ?? true,
    );
    await SkillNovaDatabase.instance.createMission(mission);
  }

  Future<void> updateMission() async {
    final mission = widget.mission!.copy(
      title: _titleController.text,
      categoryId: _selectedCourseCategoryId ?? 0,
      image: _imagePathController.text,
      courseMaterialsCount: int.parse(
          _courseMaterialsCountController.text.isEmpty
              ? '0'
              : _courseMaterialsCountController.text),
      xpReward: int.parse(
          _xpRewardController.text.isEmpty ? '0' : _xpRewardController.text),
      duration: Duration(
        days: int.parse(_durationDaysController.text.isEmpty
            ? '0'
            : _durationDaysController.text),
        hours: int.parse(_durationHoursController.text.isEmpty
            ? '0'
            : _durationHoursController.text),
        minutes: int.parse(_durationMinutesController.text.isEmpty
            ? '0'
            : _durationMinutesController.text),
        seconds: int.parse(_durationSecondsController.text.isEmpty
            ? '0'
            : _durationSecondsController.text),
      ),
      isActive: _isActive ?? true,
    );
    await SkillNovaDatabase.instance.updateMission(mission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.mission != null ? 'Update Mission' : 'Add A New Mission'),
        actions: widget.mission != null
            ? [
                IconButton(
                  onPressed: () async {
                    await SkillNovaDatabase.instance.deleteMission(
                      widget.mission!.id!,
                    );
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ]
            : [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Mission Name',
                    hintText: 'e.g. Belajar Looping dalam Python',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a name for this mission.';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              TextFormField(
                controller: _imagePathController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Image Path',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.folder),
                    onPressed: _pickAndCopyImage,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty && _selectedImage == null) {
                    return 'Please provide an image file for this specific mission';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _selectedImage != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selected Image:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Image.file(
                          _selectedImage!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  : const Text(
                      'No image file currently selected.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
              const SizedBox(height: 20),
              // Course Materials Count
              TextFormField(
                controller: _courseMaterialsCountController,
                decoration: const InputDecoration(
                  suffixText: "Course Materials",
                  suffixIcon: Icon(Icons.book),
                  labelText: 'Course Materials Count',
                  hintText: 'e.g. 10',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4), // Maximum 1000
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    if (newValue.text.isNotEmpty &&
                        int.parse(newValue.text) > 1000) {
                      return oldValue;
                    }
                    return newValue;
                  }),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide the number of course materials.';
                  }
                  final count = int.tryParse(value);
                  if (count == null || count < 1 || count > 1000) {
                    return 'Value must be between 1 and 1000.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // XP Reward
              TextFormField(
                controller: _xpRewardController,
                decoration: const InputDecoration(
                  prefixText: "+  ",
                  suffixIcon: Icon(Icons.star),
                  suffixText: "XP",
                  labelText: 'XP Reward',
                  hintText: 'e.g. 100',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide the XP reward.';
                  }
                  final xp = int.tryParse(value);
                  if (xp == null || xp < 1) {
                    return 'Value must be at least 1.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Duration
              const Text(
                'Time Limit / Duration (Days, Hours, Minutes, Seconds)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // Days
                  Expanded(
                    child: TextFormField(
                      controller: _durationDaysController,
                      decoration: const InputDecoration(
                        labelText: 'Days',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Days cannot be empty.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Hours
                  Expanded(
                    child: TextFormField(
                      controller: _durationHoursController,
                      decoration: const InputDecoration(
                        labelText: 'Hours',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          final value = int.tryParse(newValue.text);
                          if (value != null && value > 23) {
                            return oldValue;
                          }
                          return newValue;
                        }),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Hours cannot be empty.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Minutes
                  Expanded(
                    child: TextFormField(
                      controller: _durationMinutesController,
                      decoration: const InputDecoration(
                        labelText: 'Minutes',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          final value = int.tryParse(newValue.text);
                          if (value != null && value > 59) {
                            return oldValue;
                          }
                          return newValue;
                        }),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Minutes cannot be empty.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Seconds
                  Expanded(
                    child: TextFormField(
                      controller: _durationSecondsController,
                      decoration: const InputDecoration(
                        labelText: 'Seconds',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          final value = int.tryParse(newValue.text);
                          if (value != null && value > 59) {
                            return oldValue;
                          }
                          return newValue;
                        }),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Seconds cannot be empty.';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Course Category Dropdown
              DropdownButtonFormField<int>(
                value: _selectedCourseCategoryId,
                decoration: const InputDecoration(
                  labelText: 'Course Category',
                  border: OutlineInputBorder(),
                ),
                items: _courseCategoryItems.isNotEmpty ? _courseCategoryItems : [],
                onChanged: _courseCategoryItems.isNotEmpty ? (value) {
                  setState(() => _selectedCourseCategoryId = value);
                } : null,
                hint: _courseCategoryItems.isNotEmpty ? const Text('Select a course category') : const Text('No course categories available'),
                validator: (value) {
                  if (value == null) {
                    return "Please select a course category, or add one if you haven't added any.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // IsActive Checkbox
              CheckboxListTile(
                title: const Text('Activate this mission for display?'),
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: addUpdateMission,
                child: Text(
                  widget.mission != null
                      ? 'Update This Mission'
                      : 'Add A New Mission',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUpdateMission() async {
    setState(() => _selectedCourseCategoryId == null);
    setState(() => _selectedImage == null);

    if (_formKey.currentState!.validate() &&
        _selectedCourseCategoryId != null &&
        _selectedImage != null) {
      _formKey.currentState!.save();

      final isUpdating = widget.mission != null;

      if (isUpdating) {
        await updateMission();
      } else {
        await addMission();
      }

      Navigator.of(context).pop();
    }
  }
}
