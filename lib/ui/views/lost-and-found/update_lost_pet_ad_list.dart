import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/lost_animal_model.dart';
import 'package:pat_e/core/services/lost_animal_service.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/views/lost-and-found/update_lost_pet_ad.dart';

class UpdateLostPetAdList extends StatefulWidget {
  const UpdateLostPetAdList({Key? key}) : super(key: key);

  @override
  _UpdateLostPetAdListState createState() => _UpdateLostPetAdListState();
}

class _UpdateLostPetAdListState extends State<UpdateLostPetAdList> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.updateLostPetAdListTitle,
      ),
      body: ListView.builder(
        itemCount: _lostAnimals.length,
        itemBuilder: (context, index) {
          return CustomLostPetTile(
            lostAnimal: _lostAnimals[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateLostPetAd(
                    lostAnimal: _lostAnimals[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomLostPetTile extends StatelessWidget {
  final LostAnimal lostAnimal;
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');
  final VoidCallback onTap;

  CustomLostPetTile({
    required this.lostAnimal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child:
                      lostAnimal.photos != null && lostAnimal.photos!.isNotEmpty
                          ? Image.network(
                              lostAnimal.photos![0],
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: Colors.grey,
                            ),
                ),
              ),
              SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lostAnimal.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(lostAnimal.type),
                  ],
                ),
              ),
              SizedBox(width: 100),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kaybolma Tarihi: ${_dateFormat.format(lostAnimal.lostDate)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
