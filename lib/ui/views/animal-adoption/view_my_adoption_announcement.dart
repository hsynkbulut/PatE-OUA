// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/animal_adoption_model.dart';
import 'package:pat_e/core/services/animal_adoption_service.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class ViewMyAdoptionAnnouncement extends StatefulWidget {
  const ViewMyAdoptionAnnouncement({Key? key}) : super(key: key);

  @override
  _ViewMyAdoptionAnnouncementState createState() =>
      _ViewMyAdoptionAnnouncementState();
}

class _ViewMyAdoptionAnnouncementState
    extends State<ViewMyAdoptionAnnouncement> {
  List<AnimalAdoption> _animals = [];

  @override
  void initState() {
    super.initState();
    getAnimals();
  }

  Future<void> getAnimals() async {
    try {
      List<AnimalAdoption> animals =
          await AnimalAdoptionService().getUserAnimalAdoptions();
      setState(() {
        _animals = animals;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.viewMyAdoptionAnnouncementTitle,
      ),
      body: ListView.builder(
        itemCount: _animals.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.file(
                File(_animals[index].photos![0]),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                _animals[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(_animals[index].type),
              trailing: Text(
                _animals[index].isAdopted
                    ? 'Sahiplendirildi'
                    : 'Sahiplendirilmeyi Bekliyor',
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _animals[index].name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Tipi: ${_animals[index].type}'),
                            Text('Yaşı: ${_animals[index].age}'),
                            Text('Cinsiyeti: ${_animals[index].gender}'),
                            Text(
                                'Sahiplendirme Koşulları: ${_animals[index].adoptionConditions}'),
                            SizedBox(height: 16),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _animals[index].photos!.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                      File(_animals[index].photos![i]),
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Tamam'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
