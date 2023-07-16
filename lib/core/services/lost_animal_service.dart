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

  // kayıp hayvan ilanı oluşturma
  Future createLostAnimal(LostAnimal animal, List<File> photos) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('lostanimals')
          .doc(animal.lostAnimalID)
          .set(animal.toMap());

      // hayvanın fotoğraflarını storage'a yükleme ve linklerini alıp firestore'a kaydetme
      await uploadPhotosAndGetLinks(animal.lostAnimalID!, photos);
    } catch (e) {
      print(e.toString());
    }
  }

  // kayıp hayvan ilanı güncelleme
  Future updateLostAnimal(LostAnimal animal, List<File> photos) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('lostanimals')
          .doc(animal.lostAnimalID)
          .update(animal.toMap());

      // hayvanın fotoğraflarını storage'a yükleme
      await uploadPhotosAndGetLinks(animal.lostAnimalID!, photos);
    } catch (e) {
      print(e.toString());
    }
  }

  //kayıp hayvan ilanı silme
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

  // Kayıp hayvanı getiren fonksiyon
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

  // kayıp hayvan ilanı listesi getirme
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

  // Kullanıcının kendi ilanlarını getiren özel bir fonksiyon
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

  // fotoğrafları storage'a yükleme ve linklerini alıp firestore'a kaydetme fonksiyonu
  Future uploadPhotosAndGetLinks(String lostAnimalID, List<File> photos) async {
    try {
      // linkleri tutmak için boş bir liste oluşturma
      List<String> links = [];
      for (int i = 0; i < photos.length; i++) {
        // fotoğrafı File olarak okuma
        File photo = photos[i];

        // storage'da referans oluşturma
        Reference ref = _storage
            .ref()
            .child('users')
            .child(_auth.currentUser!.uid)
            .child('lostanimals')
            .child(lostAnimalID)
            .child('photos')
            .child('$i');

        // fotoğrafı storage'a yükleme
        UploadTask task = ref.putFile(photo);
        await task.whenComplete(() {});

        // fotoğrafın linkini alıp listeye ekleme
        String link = await ref.getDownloadURL();
        links.add(link);
      }

      // linkleri firestore'a kaydetme
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('lostanimals')
          .doc(lostAnimalID)
          .update({'photos': links});
    } catch (e) {
      print(e.toString());
    }
  }

  /*
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
  */

  // fotoğrafları storage'dan silme fonksiyonu
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
        // her bir fotoğrafı silme
        await item.delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
