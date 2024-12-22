import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/course_category.dart';
import 'package:skill_nova_app/models/custom/CustomDuration.dart';

final _formKey = GlobalKey<FormState>();

class AddCourseCategoryScreen extends StatefulWidget {
  const AddCourseCategoryScreen({super.key, this.courseCategory});

  final CourseCategory? courseCategory;

  @override
  State<AddCourseCategoryScreen> createState() =>
      _AddCourseCategoryScreenState();
}

class _AddCourseCategoryScreenState extends State<AddCourseCategoryScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _imagePathController;
  File? _selectedImage;

  late final TextEditingController _skillController;
  late final TextEditingController _tagController;
  final List<String> _skills = [];
  final List<String> _tags = [];

  String? _certificateType;

  late final TextEditingController _lowerYearsController;
  late final TextEditingController _lowerMonthsController;
  late final TextEditingController _lowerDaysController;
  late final TextEditingController _upperYearsController;
  late final TextEditingController _upperMonthsController;
  late final TextEditingController _upperDaysController;

  bool _skillsValidated = false;
  bool _tagsValidated = false;

  @override
  void initState() {
    _titleController = TextEditingController();
    _imagePathController = TextEditingController();
    _skillController = TextEditingController();
    _tagController = TextEditingController();
    _lowerYearsController = TextEditingController(text: '0');
    _lowerMonthsController = TextEditingController(text: '0');
    _lowerDaysController = TextEditingController(text: '0');
    _upperYearsController = TextEditingController();
    _upperMonthsController = TextEditingController();
    _upperDaysController = TextEditingController();
    if (widget.courseCategory != null) {
      _titleController.text = widget.courseCategory!.title;
      _imagePathController.text = widget.courseCategory!.image;
      _skills.addAll(widget.courseCategory!.skills);
      _tags.addAll(widget.courseCategory!.tags);
      _certificateType = widget.courseCategory!.certificateType;
      _lowerYearsController.text =
          widget.courseCategory!.lowerDuration.years.toString();
      _lowerMonthsController.text =
          widget.courseCategory!.lowerDuration.months.toString();
      _lowerDaysController.text =
          widget.courseCategory!.lowerDuration.days.toString();
      _upperYearsController.text =
          widget.courseCategory!.upperDuration.years.toString();
      _upperMonthsController.text =
          widget.courseCategory!.upperDuration.months.toString();
      _upperDaysController.text =
          widget.courseCategory!.upperDuration.days.toString();
      _selectedImage = File(_imagePathController.text);
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imagePathController.dispose();
    _skillController.dispose();
    _tagController.dispose();
    _lowerYearsController.dispose();
    _lowerMonthsController.dispose();
    _lowerDaysController.dispose();
    _upperYearsController.dispose();
    _upperMonthsController.dispose();
    _upperDaysController.dispose();
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
            content: Text('Image file selection cancelled for this course category.')),
      );
    }
  }

  Future<void> addCourseCategory() async {
    _lowerYearsController.text =
        _lowerYearsController.text.isEmpty ? '0' : _lowerYearsController.text;
    _lowerMonthsController.text =
        _lowerMonthsController.text.isEmpty ? '0' : _lowerMonthsController.text;
    _lowerDaysController.text =
        _lowerDaysController.text.isEmpty ? '0' : _lowerDaysController.text;
    final courseCategory = CourseCategory(
        title: _titleController.text,
        skills: _skills,
        lowerDuration: CustomDuration(
          years: int.parse(_lowerYearsController.text),
          months: int.parse(_lowerMonthsController.text),
          days: int.parse(_lowerDaysController.text),
        ),
        upperDuration: CustomDuration(
          years: int.parse(_upperYearsController.text.isEmpty
              ? _lowerYearsController.text
              : _upperYearsController.text),
          months: int.parse(_upperMonthsController.text.isEmpty
              ? _lowerMonthsController.text
              : _upperMonthsController.text),
          days: int.parse(_upperDaysController.text.isEmpty
              ? _lowerDaysController.text
              : _upperDaysController.text),
        ),
        certificateType: _certificateType ?? 'Unspecified',
        tags: _tags,
        image: _imagePathController.text);

    await SkillNovaDatabase.instance.createCourseCategory(courseCategory);
  }

  Future<void> updateCourseCategory() async {
    _lowerYearsController.text =
        _lowerYearsController.text.isEmpty ? '0' : _lowerYearsController.text;
    _lowerMonthsController.text =
        _lowerMonthsController.text.isEmpty ? '0' : _lowerMonthsController.text;
    _lowerDaysController.text =
        _lowerDaysController.text.isEmpty ? '0' : _lowerDaysController.text;
    final courseCategory = widget.courseCategory!.copy(
        title: _titleController.text,
        skills: _skills,
        lowerDuration: CustomDuration(
          years: int.parse(_lowerYearsController.text),
          months: int.parse(_lowerMonthsController.text),
          days: int.parse(_lowerDaysController.text),
        ),
        upperDuration: CustomDuration(
          years: int.parse(_upperYearsController.text.isEmpty
              ? _lowerYearsController.text
              : _upperYearsController.text),
          months: int.parse(_upperMonthsController.text.isEmpty
              ? _lowerMonthsController.text
              : _upperMonthsController.text),
          days: int.parse(_upperDaysController.text.isEmpty
              ? _lowerDaysController.text
              : _upperDaysController.text),
        ),
        certificateType: _certificateType ?? 'Unspecified',
        tags: _tags,
        image: _imagePathController.text);

    await SkillNovaDatabase.instance.updateCourseCategory(courseCategory);
  }

  String? _validateMinimumDuration(String? value, String label) {
    if (value == null || value.isEmpty) {
      return 'Please provide a value for $label.';
    }
    if (int.tryParse(value) == null || int.parse(value) < 0) {
      return '$label must be a non-negative number.';
    }
    return null;
  }

  String? _validateMaximumDuration(String? value, String label) {
    if (value != null && value.isNotEmpty) {
      if (int.tryParse(value) == null || int.parse(value) < 0) {
        return '$label must be a non-negative number.';
      }

      final int minYears = int.parse(_lowerYearsController.text.isEmpty
          ? '0'
          : _lowerYearsController.text);
      final int minMonths = int.parse(_lowerMonthsController.text.isEmpty
          ? '0'
          : _lowerMonthsController.text);
      final int minDays = int.parse(
          _lowerDaysController.text.isEmpty ? '0' : _lowerDaysController.text);

      final int maxYears = int.parse(_upperYearsController.text.isEmpty
          ? '0'
          : _upperYearsController.text);
      final int maxMonths = int.parse(_upperMonthsController.text.isEmpty
          ? '0'
          : _upperMonthsController.text);
      final int maxDays = int.parse(
          _upperDaysController.text.isEmpty ? '0' : _upperDaysController.text);

      final int totalMinDays = (minYears * 365) + (minMonths * 30) + minDays;
      final int totalMaxDays = (maxYears * 365) + (maxMonths * 30) + maxDays;

      if (totalMaxDays < totalMinDays) {
        return 'Maximum duration cannot be less than the minimum duration.';
      }
    }
    return null;
  }


  /// Builds the UI for adding a new course category, including input fields for
  /// title, skills, tags, certificate type, duration, and image selection.
  /// Provides functionality to validate and submit the form to add a new course
  /// category to the database. Displays the selected image and allows its removal.
  /// Includes an AppBar with a delete icon, a scrollable form, and a button to
  /// add the course category.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseCategory != null
            ? 'Update Course Category'
            : 'Add A New Course Category'),
        actions: [
          IconButton(
            onPressed: () async {
              await SkillNovaDatabase.instance.deleteCourseCategory(
                widget.courseCategory!.id!,
              );
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
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
                    labelText: 'Course Category Name',
                    hintText: 'e.g. Computer Science',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a name for the course category first.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Skills',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 8.0,
                      children: _skills
                          .map(
                            (skill) => Chip(
                              label: Text(skill),
                              onDeleted: () {
                                setState(() {
                                  _skills.remove(skill);
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _skillController,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _skills.add(value);
                          });
                          _skillController.clear();
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Add a skill',
                        errorText: _skillsValidated
                            ? "Please add at least one skill"
                            : null,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tags',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 8.0,
                      children: _tags
                          .map(
                            (tag) => Chip(
                              label: Text(tag),
                              onDeleted: () {
                                setState(() {
                                  _tags.remove(tag);
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _tagController,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _tags.add(value);
                          });
                          _tagController.clear();
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Add a tag',
                        errorText: _tagsValidated
                            ? "Please add at least one tag"
                            : null,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                DropdownButtonFormField<String>(
                  value: _certificateType,
                  items: const [
                    DropdownMenuItem(
                        value: 'Beginner', child: Text('Beginner')),
                    DropdownMenuItem(
                        value: 'Intermediate', child: Text('Intermediate')),
                    DropdownMenuItem(
                        value: 'Advanced', child: Text('Advanced')),
                    DropdownMenuItem(
                        value: 'Professional', child: Text('Professional')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _certificateType = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Certificate Type',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a certificate type';
                    }
                    return null;
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    const Text('Minimum Duration'),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _lowerYearsController,
                            decoration: const InputDecoration(
                              labelText: 'Year(s)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) => _validateMinimumDuration(value, 'Minimum Years')
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: _lowerMonthsController,
                            decoration: const InputDecoration(
                              labelText: 'Month(s)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                if (newValue.text.isNotEmpty &&
                                    int.tryParse(newValue.text) != null) {
                                  final value = int.parse(newValue.text);
                                  if (value < 0 || value > 12) {
                                    return oldValue;
                                  }
                                }
                                return newValue;
                              })
                            ],
                            validator: (value) => _validateMinimumDuration(value, 'Minimum Months')
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: _lowerDaysController,
                            decoration: const InputDecoration(
                              labelText: 'Day(s)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                if (newValue.text.isNotEmpty &&
                                    int.tryParse(newValue.text) != null) {
                                  final value = int.parse(newValue.text);
                                  if (value < 0 || value > 30) {
                                    return oldValue;
                                  }
                                }
                                return newValue;
                              })
                            ],
                            validator: (value) => _validateMinimumDuration(value, 'Minimum Days'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    const Text('Maximum Duration (Optional)'),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _upperYearsController,
                            decoration: const InputDecoration(
                              labelText: 'Year(s)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              /*MaxDurationFormatter(
                                  lowerYearsController: _lowerYearsController,
                                  lowerMonthsController: _lowerMonthsController,
                                  lowerDaysController: _lowerDaysController,
                                  unit: 'year')*/
                            ],
                            validator: (value) => _validateMaximumDuration(value, 'Maximum Years'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: _upperMonthsController,
                            decoration: const InputDecoration(
                              labelText: 'Month(s)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                if (newValue.text.isNotEmpty &&
                                    int.tryParse(newValue.text) != null) {
                                  final value = int.parse(newValue.text);
                                  if (value < 0 || value > 12) {
                                    return oldValue;
                                  }
                                }
                                return newValue;
                              }),
                              /*MaxDurationFormatter(
                                  lowerYearsController: _lowerYearsController,
                                  lowerMonthsController: _lowerMonthsController,
                                  lowerDaysController: _lowerDaysController,
                                  unit: 'month')*/
                            ],
                            validator: (value) => _validateMaximumDuration(value, 'Maximum Months'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: _upperDaysController,
                            decoration: const InputDecoration(
                              labelText: 'Day(s)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                if (newValue.text.isNotEmpty &&
                                    int.tryParse(newValue.text) != null) {
                                  final value = int.parse(newValue.text);
                                  if (value < 0 || value > 30) {
                                    return oldValue;
                                  }
                                }
                                return newValue;
                              }),
                              /*MaxDurationFormatter(
                                  lowerYearsController: _lowerYearsController,
                                  lowerMonthsController: _lowerMonthsController,
                                  lowerDaysController: _lowerDaysController,
                                  unit: 'day')*/
                            ],
                            validator: (value) => _validateMaximumDuration(value, 'Maximum Days'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                      return 'Please select an image file for this course category.';
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
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                        style: TextStyle(color: Colors.grey),
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: addUpdateCourseCategory,
                  child: Text(widget.courseCategory != null
                      ? 'Update This Course Category'
                      : 'Add A New Course Category'),
                )
              ],
            ),
          )),
    );
  }

  Future<void> addUpdateCourseCategory() async {
    setState(() => _skillsValidated = _skills.isEmpty);
    setState(() => _tagsValidated = _tags.isEmpty);

    if (_formKey.currentState!.validate() &&
        !_tagsValidated &&
       !_skillsValidated) {
      _formKey.currentState!.save();

      final isUpdating = widget.courseCategory != null;

      if (isUpdating) {
        await updateCourseCategory();
      } else {
        await addCourseCategory();
      }

      Navigator.of(context).pop();
    }
  }
}
