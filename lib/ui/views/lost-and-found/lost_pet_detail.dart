import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/lost_animal_model.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/main.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class LostPetDetail extends StatefulWidget {
  final LostAnimal lostAnimal;

  LostPetDetail({required this.lostAnimal});

  @override
  _LostPetDetailState createState() => _LostPetDetailState();
}

class _LostPetDetailState extends State<LostPetDetail> {
  int _selectedPhotoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.lostPetDetailTitle,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: PageView.builder(
                          itemCount: widget.lostAnimal.photos!.length,
                          controller:
                              PageController(initialPage: _selectedPhotoIndex),
                          onPageChanged: (index) {
                            setState(() {
                              _selectedPhotoIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return InteractiveViewer(
                              child: Image.file(
                                File(widget.lostAnimal.photos![index]),
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  Hero(
                    tag: widget.lostAnimal.photos![0],
                    child: PageView.builder(
                      itemCount: widget.lostAnimal.photos!.length,
                      controller:
                          PageController(initialPage: _selectedPhotoIndex),
                      onPageChanged: (index) {
                        setState(() {
                          _selectedPhotoIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                  File(widget.lostAnimal.photos![index])),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.lostAnimal.name,
                            style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                widget.lostAnimal.isLost ? 'Kayıp' : 'Bulundu',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      buildPetFeature(widget.lostAnimal.type, 'Türü'),
                      buildPetFeature(widget.lostAnimal.age, 'Yaşı'),
                      buildPetFeature(widget.lostAnimal.gender, 'Cinsiyeti'),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Açıklama',
                    style: TextStyle(
                      color: gold,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.lostAnimal.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        'İletişim Numarası:',
                        style: TextStyle(
                          color: mainAuxiliaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.lostAnimal.contactNumber,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        'Kaybolma Tarihi:',
                        style: TextStyle(
                          color: mainAuxiliaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat('dd.MM.yyyy')
                            .format(widget.lostAnimal.lostDate),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPetFeature(String value, String feature) {
    return Expanded(
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: mainAuxiliaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              feature,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
