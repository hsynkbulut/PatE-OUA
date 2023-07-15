// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/lost_animal_model.dart';
import 'package:pat_e/core/services/lost_animal_service.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/components/custom_text_input.dart';

class CreateLostPetAd extends StatefulWidget {
  @override
  _CreateLostPetAdState createState() => _CreateLostPetAdState();
}

class _CreateLostPetAdState extends State<CreateLostPetAd> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _gender = '';
  DateTime? _selectedDate;
  bool _isLost = false;
  List<File> _selectedPhotos = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickPhotos() async {
    List<XFile>? pickedImages = await _picker.pickMultiImage(imageQuality: 70);
    if (pickedImages != null) {
      List<File> selectedPhotos =
          pickedImages.map((e) => File(e.path)).toList();
      setState(() {
        _selectedPhotos = selectedPhotos;
      });
    }
  }

  Future<void> _createLostAnimal() async {
    if (_selectedPhotos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen en az bir fotoğraf seçiniz')),
      );
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen bir tarih seçiniz')),
      );
      return;
    }

    String newLostAnimalID = DateTime.now().millisecondsSinceEpoch.toString();

    LostAnimal lostAnimal = LostAnimal(
      lostAnimalID: newLostAnimalID,
      type: _typeController.text,
      name: _nameController.text,
      age: _ageController.text,
      gender: _gender,
      photos: [], // Boş liste olarak başlatalım
      lostDate: _selectedDate!,
      contactNumber: _contactNumberController.text,
      description: _descriptionController.text,
      isLost: _isLost,
    );

    LostAnimalService service = LostAnimalService();

    try {
      // Güncellenmiş nesneyi Firestore veritabanına kaydedelim
      await service.createLostAnimal(lostAnimal, _selectedPhotos);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kayıp hayvan ilanı oluşturma başarılı')),
      );
      _resetForm();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kayıp hayvan ilanı oluşturma başarısız')),
      );
      print(e.toString());
    }
  }

  void _resetForm() {
    _typeController.clear();
    _nameController.clear();
    _ageController.clear();
    _contactNumberController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedPhotos = [];
      _gender = '';
      _selectedDate = null;
      _isLost = false;
    });
  }

  @override
  void dispose() {
    _typeController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _contactNumberController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.createLostPetAdTitle,
      ),
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickPhotos,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _selectedPhotos.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _selectedPhotos.length,
                          itemBuilder: (context, index) {
                            return Image.file(
                              _selectedPhotos[index],
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : const Icon(
                          Icons.camera_alt,
                          color: primaryColor,
                          size: 40,
                        ),
                ),
              ),
              CustomTextInput(
                textEditController: _typeController,
                hintTextString: 'Hayvanın türünü girin',
                inputType: InputType.Default,
                enableBorder: true,
                themeColor: primaryColor,
                cornerRadius: 10.0,
                maxLength: 24,
                prefixIcon: const Icon(Icons.pets, color: primaryColor),
                textColor: Colors.black,
                errorMessage: 'Hayvan türü boş bırakılamaz',
                labelText: 'Hayvanın Türü',
              ),
              CustomTextInput(
                textEditController: _nameController,
                hintTextString: 'Hayvanın Adını girin',
                inputType: InputType.Default,
                enableBorder: true,
                cornerRadius: 10.0,
                maxLength: 24,
                errorMessage: 'Hayvan adı boş bırakılamaz',
                labelText: 'Hayvanın Adı',
                prefixIcon: const Icon(Icons.near_me, color: primaryColor),
                textColor: mainAuxiliaryColor,
                themeColor: primaryColor,
              ),
              CustomTextInput(
                textEditController: _ageController,
                hintTextString: 'Hayvanın yaşını girin',
                inputType: InputType.Default,
                enableBorder: true,
                cornerRadius: 10.0,
                maxLength: 16,
                prefixIcon: const Icon(Icons.date_range, color: primaryColor),
                errorMessage: 'Hayvan yaşı boş bırakılamaz',
                labelText: 'Hayvanın Yaşı',
                textColor: mainAuxiliaryColor,
                themeColor: primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'Dişi',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  const Text('Dişi'),
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'Erkek',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  const Text('Erkek'),
                ],
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Bir tarih seçin'
                            : 'Seçilen tarih: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: TextStyle(
                          color: _selectedDate == null
                              ? primaryColor
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.calendar_today,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextInput(
                textEditController: _contactNumberController,
                hintTextString: 'İletişim numaranızı girin',
                inputType: InputType.Number,
                enableBorder: true,
                cornerRadius: 10.0,
                maxLength: 11,
                prefixIcon: const Icon(Icons.phone, color: primaryColor),
                labelText: 'İletişim Numarası',
                textColor: mainAuxiliaryColor,
                themeColor: primaryColor,
                errorMessage: 'Telefon numarası boş bırakılamaz',
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  maxLength: 400,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: "Açıklama",
                    labelStyle: TextStyle(color: primaryColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, style: BorderStyle.solid, color: gold),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: primaryColor),
                    ),
                    hintText: 'Açıklama girin',
                    prefixIcon: Icon(
                      Icons.description,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bulundu'),
                  Switch(
                    value: _isLost,
                    onChanged: (value) {
                      setState(() {
                        _isLost = value;
                      });
                    },
                    activeTrackColor: primaryColor,
                    activeColor: secondaryColor,
                  ),
                  const Text('Kayıp'),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: TextButton(
                  onPressed: _createLostAnimal,
                  child: const Text(
                    'İlanı Oluştur',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
