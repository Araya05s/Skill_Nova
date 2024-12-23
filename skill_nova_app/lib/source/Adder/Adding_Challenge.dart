import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/challenge.dart';
import 'package:skill_nova_app/models/question.dart';

final _formKey = GlobalKey<FormState>();

class AddChallengeScreen extends StatefulWidget {
  const AddChallengeScreen({super.key, this.challenge});

  final Challenge? challenge;

  @override
  State<AddChallengeScreen> createState() => _AddChallengeScreenState();
}

class _AddChallengeScreenState extends State<AddChallengeScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _imagePathController;
  late final TextEditingController _questionsCountController;
  late final TextEditingController _xpRewardController;
  late final TextEditingController _durationHoursController;
  late final TextEditingController _durationMinutesController;
  late final TextEditingController _durationSecondsController;

  File? _selectedImage;
  int? _selectedCourseCategoryId;
  List<DropdownMenuItem<int>> _courseCategoryItems = [];
  Difficulty? _selectedDifficulty = Difficulty.Muda;
  bool? _isActive = true;

  Future<void> fetchCourseCategories() async {
    final courseCategories =
        await SkillNovaDatabase.instance.readAllCourseCategories();

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
    _titleController =
        TextEditingController(text: widget.challenge?.title ?? '');
    _selectedImage =
        widget.challenge?.image != null ? File(widget.challenge!.image) : null;
    _imagePathController =
        TextEditingController(text: widget.challenge?.image ?? '');
    _questionsCountController = TextEditingController(
        text: widget.challenge?.questions.length.toString() ?? '');
    _xpRewardController = TextEditingController(
        text: widget.challenge?.xpReward.toString() ?? '');
    _durationHoursController = TextEditingController(
        text: widget.challenge?.duration.inHours.toString() ?? '');
    _durationMinutesController = TextEditingController(
        text: widget.challenge?.duration.inMinutes.remainder(60).toString() ??
            '');
    _durationSecondsController = TextEditingController(
        text: widget.challenge?.duration.inSeconds.remainder(60).toString() ??
            '');
    _selectedCourseCategoryId = widget.challenge?.categoryId;
    _selectedDifficulty = widget.challenge?.difficulty;
    _isActive = widget.challenge?.isActive ?? true;
    fetchCourseCategories();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imagePathController.dispose();
    _questionsCountController.dispose();
    _xpRewardController.dispose();
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
            content:
                Text('Image file selection cancelled for this challenge.')),
      );
    }
  }

  Future<void> addChallenge() async {
    final int questionsCount = int.parse(
      _questionsCountController.text.isEmpty
          ? '0'
          : _questionsCountController.text,
    );

    final List<Question> generatedQuestions = List.generate(
      questionsCount,
      (index) => Question(
        question: 'Question ${index + 1}', // Example question text
        options: [
          'Option A',
          'Option B',
          'Option C',
          'Option D',
          'Option E',
        ], // Default options
        correctOptionIndex: 0, // Default correct option index
      ),
    );

    final challenge = Challenge(
      title: _titleController.text,
      categoryId: _selectedCourseCategoryId ?? 0,
      image: _imagePathController.text,
      questions: questionsCount == 0 ? [] : generatedQuestions,
      xpReward: int.parse(
          _xpRewardController.text.isEmpty ? '0' : _xpRewardController.text),
      duration: Duration(
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
      difficulty: _selectedDifficulty ?? Difficulty.Muda,
      isActive: _isActive ?? true,
    );
    await SkillNovaDatabase.instance.createChallenge(challenge);
  }

  Future<void> updateChallenge() async {
    final int questionsCount = int.parse(
      _questionsCountController.text.isEmpty
          ? '0'
          : _questionsCountController.text,
    );

    // Generate a new list of questions based on the updated count
    final List<Question> updatedQuestions = List.generate(
      questionsCount,
      (index) => Question(
        question: 'Updated Question ${index + 1}', // Updated question text
        options: [
          'Option A',
          'Option B',
          'Option C',
          'Option D',
          'Option E',
        ], // Default options
        correctOptionIndex: 0, // Default correct option index
      ),
    );

    final challenge = widget.challenge!.copy(
      title: _titleController.text,
      categoryId: _selectedCourseCategoryId ?? widget.challenge!.categoryId,
      image: _imagePathController.text.isEmpty
          ? widget.challenge!.image
          : _imagePathController.text,
      questions: questionsCount == 0 ? [] : updatedQuestions,
      xpReward: int.parse(
        _xpRewardController.text.isEmpty ? '0' : _xpRewardController.text,
      ),
      duration: Duration(
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
      difficulty: _selectedDifficulty ?? widget.challenge!.difficulty,
      isActive: _isActive ?? widget.challenge!.isActive,
    );

    await SkillNovaDatabase.instance.updateChallenge(challenge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.challenge != null ? 'Update This Challenge' : 'Add A New Challenge'),
        actions: widget.challenge != null ? [
          IconButton(
            onPressed: () async {
              await SkillNovaDatabase.instance.deleteChallenge(
                widget.challenge!.id!,
              );
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ] : [],
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
                  labelText: 'Challenge Name',
                  hintText: 'e.g. Daily Conversation',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide a name for this challenge';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _imagePathController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Image Path',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _pickAndCopyImage, 
                    icon: const Icon(Icons.folder),
                  )
                ),
                validator: (value) {
                  if (value!.isEmpty && _selectedImage == null) {
                    return 'Please provide an image file for this specific challenge';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
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
                      const SizedBox(height: 10,),
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
              const SizedBox(height: 20,),
              TextFormField(
                controller: _questionsCountController,
                decoration: const InputDecoration(
                  suffixText: "Questions",
                  suffixIcon: Icon(Icons.quiz_rounded),
                  labelText: 'Number of Questions',
                  hintText: 'e.g. 15',
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
                    return 'Please provide the amount of questions that are going to be asked in this challenge.';
                  }
                  final count = int.tryParse(value);
                  if (count == null || count < 1 || count > 1000) {
                    return 'Value must be between 1 and 1000.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField<Difficulty>(
                value: _selectedDifficulty,
                items: Difficulty.values.map(
                  (difficulty) => DropdownMenuItem(
                    value: difficulty,
                    child: Text(difficulty.name),
                  ),
                ).toList(), 
                onChanged: (value) => setState(() => _selectedDifficulty = value),
                hint: const Text('Select a difficulty level'),
                decoration: const InputDecoration(
                  labelText: 'Difficulty Level',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a difficulty level for this specific challenge.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
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
              const Text(
                'Time Limit / Duration (Hours, Minutes, Seconds)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
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
                onPressed: addUpdateChallenge,
                child: Text(
                  widget.challenge != null
                      ? 'Update This Challenge'
                      : 'Add A New Challenge',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUpdateChallenge() async {
    setState(() => _selectedCourseCategoryId == null);
    setState(() => _selectedImage == null);

    if (_formKey.currentState!.validate() &&
        _selectedCourseCategoryId != null &&
        _selectedImage != null) {
      _formKey.currentState!.save();

      final isUpdating = widget.challenge != null;

      if (isUpdating) {
        await updateChallenge();
      } else {
        await addChallenge();
      }

      Navigator.of(context).pop();
    }
  }
}
