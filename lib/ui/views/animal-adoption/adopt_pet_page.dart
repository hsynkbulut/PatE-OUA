import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/animal_adoption_model.dart';
import 'package:pat_e/core/services/animal_adoption_service.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/views/animal-adoption/adopt_pet_detail.dart';

class AdoptPet extends StatefulWidget {
  const AdoptPet({Key? key}) : super(key: key);

  @override
  _AdoptPetState createState() => _AdoptPetState();
}

class _AdoptPetState extends State<AdoptPet> {
  List<AnimalAdoption> _animals = [];

  @override
  void initState() {
    super.initState();
    getAnimals();
  }

  Future<void> getAnimals() async {
    try {
      List<AnimalAdoption> animals =
          await AnimalAdoptionService().getAnimalAdoptions();
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
        pageTitle: AppConstant.adoptPetTitle,
      ),
      body: ListView.builder(
        itemCount: _animals.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  _animals[index].photos![0],
                  fit: BoxFit.cover,
                ),
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
                    : 'Bekliyor',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdoptPetDetail(
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
