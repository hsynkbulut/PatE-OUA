// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pat_e/core/models/lost_animal_model.dart';

class LostAnimalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future createLostAnimal(LostAnimal animal) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('lostanimals')
          .doc(animal.lostAnimalID)
          .set(animal.toMap());

      await uploadPhotos(animal.lostAnimalID!, animal.photos!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateLostAnimal(LostAnimal animal) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('lostanimals')
          .doc(animal.lostAnimalID)
          .update(animal.toMap());

      await uploadPhotos(animal.lostAnimalID!, animal.photos!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteLostAnimal(String lostAnimalID) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('lostanimals')
          .doc(lostAnimalID)
          .delete();

      await deletePhotos(lostAnimalID);
    } catch (e) {
      print(e.toString());
    }
  }

/*
  Future<LostAnimal?> getLostAnimal(String lostAnimalID) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('lostanimals')
          .doc(lostAnimalID)
          .get();

      if (doc.exists) {
        LostAnimal animal =
            LostAnimal.fromMap(doc.data() as Map<String, dynamic>);
        return animal;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
*/

  Future<List<LostAnimal>> getLostAnimals() async {
    try {
      QuerySnapshot query = await _firestore
          .collectionGroup('lostanimals')
          .orderBy('lostAnimalID')
          .get();

      List<LostAnimal> animals = query.docs
          .map((doc) => LostAnimal.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return animals;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<LostAnimal>> getUserLostAnimals() async {
    try {
      String uid = _auth.currentUser!.uid;

      QuerySnapshot query = await _firestore
          .collection('users')
          .doc(uid)
          .collection('lostanimals')
          .orderBy('lostAnimalID')
          .get();

      List<LostAnimal> animals = query.docs
          .map((doc) => LostAnimal.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return animals;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future uploadPhotos(String lostAnimalID, List<String> photos) async {
    try {
      for (int i = 0; i < photos.length; i++) {
        File photo = File(photos[i]);
        Reference ref = _storage
            .ref()
            .child('users')
            .child(_auth.currentUser!.uid)
            .child('lostanimals')
            .child(lostAnimalID)
            .child('photos')
            .child('$i');

        UploadTask task = ref.putFile(photo);
        await task.whenComplete(() {});
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deletePhotos(String lostAnimalID) async {
    try {
      Reference ref = _storage
          .ref()
          .child('users')
          .child(_auth.currentUser!.uid)
          .child('lostanimals')
          .child(lostAnimalID)
          .child('photos');

      ListResult result = await ref.listAll();
      for (Reference item in result.items) {
        await item.delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
