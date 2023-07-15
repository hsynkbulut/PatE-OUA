import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/lost_animal_model.dart';
import 'package:pat_e/core/services/lost_animal_service.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/views/animal-adoption/adopt_pet_detail.dart';
import 'package:pat_e/ui/views/lost-and-found/lost_pet_detail.dart';

class SearchForLostPets extends StatefulWidget {
  const SearchForLostPets({Key? key}) : super(key: key);

  @override
  _SearchForLostPetsState createState() => _SearchForLostPetsState();
}

class _SearchForLostPetsState extends State<SearchForLostPets> {
  List<LostAnimal> _lostAnimals = [];

  @override
  void initState() {
    super.initState();
    getLostAnimals();
  }

  Future<void> getLostAnimals() async {
    try {
      List<LostAnimal> lostAnimals = await LostAnimalService().getLostAnimals();
      setState(() {
        _lostAnimals = lostAnimals;
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
        pageTitle: AppConstant.searchForLostPetsTitle,
      ),
      body: ListView.builder(
        itemCount: _lostAnimals.length,
        itemBuilder: (context, index) {
          return CustomLostPetTile(
            lostAnimal: _lostAnimals[index],
          );
        },
      ),
    );
  }
}

class CustomLostPetTile extends StatelessWidget {
  final LostAnimal lostAnimal;

  CustomLostPetTile({required this.lostAnimal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: lostAnimal.photos != null && lostAnimal.photos!.isNotEmpty
            ? Image.file(
                File(lostAnimal.photos![0]),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )
            : Container(
                width: 80,
                height: 80,
                color: Colors.grey,
              ),
        title: Text(
          lostAnimal.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(lostAnimal.type),
        trailing: Text(
          lostAnimal.isLost ? 'Kayıp' : 'Bulundu',
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LostPetDetail(
                lostAnimal: lostAnimal,
              ),
            ),
          );
        },
      ),
    );
  }
}
