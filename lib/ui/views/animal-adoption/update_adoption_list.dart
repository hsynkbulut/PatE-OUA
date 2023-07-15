// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/animal_adoption_model.dart';
import 'package:pat_e/core/services/animal_adoption_service.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/views/animal-adoption/update_adoption_announcement.dart';

class UpdateAdoptionList extends StatefulWidget {
  const UpdateAdoptionList({Key? key}) : super(key: key);

  @override
  _UpdateAdoptionListState createState() => _UpdateAdoptionListState();
}

class _UpdateAdoptionListState extends State<UpdateAdoptionList> {
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
        pageTitle: AppConstant.aboutTitle,
      ),
      body: ListView.builder(
        itemCount: _animals.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                _animals[index].photos![0],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                _animals[index].name,
                style: const TextStyle(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateAdoptionAnnouncement(
                      animalAdoption: _animals[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
