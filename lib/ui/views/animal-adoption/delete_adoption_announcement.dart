// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/animal_adoption_model.dart';
import 'package:pat_e/core/services/animal_adoption_service.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class DeleteAdoptionAnnouncement extends StatefulWidget {
  const DeleteAdoptionAnnouncement({Key? key}) : super(key: key);

  @override
  _DeleteAdoptionAnnouncementState createState() =>
      _DeleteAdoptionAnnouncementState();
}

class _DeleteAdoptionAnnouncementState
    extends State<DeleteAdoptionAnnouncement> {
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

  Future<void> deleteAnnouncement(int index) async {
    try {
      AnimalAdoption deletedAnimal = _animals[index];

      await AnimalAdoptionService()
          .deleteAnimalAdoption(deletedAnimal.animalID!);

      await AnimalAdoptionService().deletePhotos(deletedAnimal.animalID!);

      setState(() {
        _animals.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('İlan silindi.'),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.deleteAdoptionAnnouncementTitle,
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('İlanı Sil'),
                      content: const Text(
                          'Bu ilanı silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Vazgeç'),
                        ),
                        TextButton(
                          onPressed: () {
                            deleteAnnouncement(index);
                            Navigator.pop(context);
                          },
                          child: const Text('Sil'),
                        ),
                      ],
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
