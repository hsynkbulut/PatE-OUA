import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/lost_animal_model.dart';
import 'package:pat_e/core/services/lost_animal_service.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class DeleteLostPetAd extends StatefulWidget {
  const DeleteLostPetAd({Key? key}) : super(key: key);

  @override
  _DeleteLostPetAdState createState() => _DeleteLostPetAdState();
}

class _DeleteLostPetAdState extends State<DeleteLostPetAd> {
  List<LostAnimal> _lostAnimals = [];

  @override
  void initState() {
    super.initState();
    getLostAnimals();
  }

  Future<void> getLostAnimals() async {
    try {
      List<LostAnimal> lostAnimals =
          await LostAnimalService().getUserLostAnimals();
      setState(() {
        _lostAnimals = lostAnimals;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteAd(int index) async {
    try {
      LostAnimal deletedAnimal = _lostAnimals[index];

      await LostAnimalService().deleteLostAnimal(deletedAnimal.lostAnimalID!);

      await LostAnimalService().deletePhotos(deletedAnimal.lostAnimalID!);

      setState(() {
        _lostAnimals.removeAt(index);
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
        pageTitle: AppConstant.deleteLostPetAdTitle,
      ),
      body: ListView.builder(
        itemCount: _lostAnimals.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.file(
                File(_lostAnimals[index].photos![0]),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                _lostAnimals[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(_lostAnimals[index].type),
              trailing: Text(
                _lostAnimals[index].isLost ? 'Kayıp' : 'Bulundu',
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
                            deleteAd(index);
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
