import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/lost_animal_model.dart';
import 'package:pat_e/core/services/lost_animal_service.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class ViewMyLostPetAds extends StatefulWidget {
  const ViewMyLostPetAds({Key? key}) : super(key: key);

  @override
  _ViewMyLostPetAdsState createState() => _ViewMyLostPetAdsState();
}

class _ViewMyLostPetAdsState extends State<ViewMyLostPetAds> {
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
        pageTitle: AppConstant.viewMyLostPetAdsTitle,
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
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  CustomLostPetTile({required this.lostAnimal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
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
                        lostAnimal.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        lostAnimal.isLost ? 'Kayıp' : 'Bulundu',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Tipi: ${lostAnimal.type}'),
                      SizedBox(height: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'İlan Tarihi: ${_dateFormat.format(lostAnimal.lostDate)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Yaşı: ${lostAnimal.age}'),
                            SizedBox(height: 4),
                            Text('Cinsiyeti: ${lostAnimal.gender}'),
                            SizedBox(height: 4),
                            Text('İletişim Numarası: ${lostAnimal.contactNumber}'),
                            SizedBox(height: 20),
                            Text('Açıklama: ${lostAnimal.description}'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lostAnimal.photos!.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 18.0, bottom: 130),
                              child: Image.file(
                                File(lostAnimal.photos![i]),
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
                          child: Text('Tamam', style: TextStyle(color: primaryColor),),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: lostAnimal.photos != null &&
                      lostAnimal.photos!.isNotEmpty
                      ? Image.file(
                    File(lostAnimal.photos![0]),
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
