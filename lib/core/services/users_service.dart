// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pat_e/core/models/users_model.dart';

class UsersService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future createUser(Users user, File? profilePhoto) async {
    try {
      String uid =
          _auth.currentUser!.uid; // Kullanıcı kimliğini Firebase Auth'tan al
      DocumentReference userRef = _firestore
          .collection('users')
          .doc(uid); // Belge referansını kullanıcı kimliği ile oluştur

      await userRef.set(user.toMap()); // Belgeyi veritabanına kaydet

      if (profilePhoto != null) {
        String photoURL = await uploadProfilePhoto(
            uid, profilePhoto); // Profil fotoğrafını yükle
        await userRef.update({
          'profilePhoto': photoURL
        }); // Belgeyi profil fotoğrafı ile güncelle
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateUser(Users user, File? newProfilePhoto) async {
    try {
      String uid = _auth.currentUser!.uid;

      await _firestore.collection('users').doc(uid).update(user.toMap());

      if (newProfilePhoto != null) {
        String photoURL = await uploadProfilePhoto(uid, newProfilePhoto);
        await _firestore
            .collection('users')
            .doc(uid)
            .update({'profilePhoto': photoURL});
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //PARAMETRE EKLEDİM
  Future<void> deleteUser(String userID) async {
    try {
      await _firestore.collection('users').doc(userID).delete();
      await deleteProfilePhoto(userID);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Users?> getUser() async {
    try {
      String uid = _auth.currentUser!.uid;

      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        Users user = Users.fromMap(doc.data() as Map<String, dynamic>);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> uploadProfilePhoto(String userID, File photo) async {
    try {
      Reference ref =
          _storage.ref().child('users').child(userID).child('profilePhoto');

      UploadTask task = ref.putFile(photo);
      await task.whenComplete(() {});

      String photoURL = await ref.getDownloadURL();
      return photoURL;
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to upload profile photo.');
    }
  }

  Future<void> deleteProfilePhoto(String userID) async {
    try {
      Reference ref =
          _storage.ref().child('users').child(userID).child('profilePhoto');
      await ref.delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
