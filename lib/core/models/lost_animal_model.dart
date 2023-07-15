import 'package:cloud_firestore/cloud_firestore.dart';

class LostAnimal {
  String? lostAnimalID;
  String type;
  String name;
  String age;
  String gender;
  List<String>?
      photos; //kullanıcının oluşturacağı ilanda yükleyeceği hayvanların fotoğraflarını liste şeklinde tutacak.
  DateTime lostDate;
  String contactNumber;
  String description;
  bool isLost;

  LostAnimal(
      {this.lostAnimalID,
      required this.type,
      required this.name,
      required this.age,
      required this.gender,
      required this.photos,
      required this.lostDate,
      required this.contactNumber,
      required this.description,
      required this.isLost});

  // LostAnimal sınıfını Map'e dönüştürme
  Map<String, dynamic> toMap() {
    return {
      'lostAnimalID': lostAnimalID,
      'type': type,
      'name': name,
      'age': age,
      'gender': gender,
      'photos': photos,
      'lostDate': lostDate,
      'contactNumber': contactNumber,
      'description': description,
      'isLost': isLost
    };
  }

  // Map'i LostAnimal sınıfına dönüştürme
  LostAnimal.fromMap(Map<String, dynamic> map)
      : lostAnimalID = map['lostAnimalID'],
        type = map['type'],
        name = map['name'],
        age = map['age'],
        gender = map['gender'],
        photos = List<String>.from(map['photos']),
        lostDate = (map['lostDate'] as Timestamp)
            .toDate(), // Timestamp'ı DateTime'a dönüştürme
        contactNumber = map['contactNumber'],
        description = map['description'],
        isLost = map['isLost'];
}
