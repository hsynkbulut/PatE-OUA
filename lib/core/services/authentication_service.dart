// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pat_e/common/helpers/custom_error_message.dart';
import 'package:pat_e/core/models/users_model.dart';
import 'package:pat_e/core/services/users_service.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UsersService _usersService = UsersService();

  // Kullanıcının uygulamaya kaydolmasını sağlar
  Future<String?> signUpUser(
      {required String email,
      required String password,
      required String username,
      File? profilePhoto}) async {
    try {
      // email, username ve password değerlerini boş olup olmadıklarını kontrol et
      if (email.isEmpty) {
        Fluttertoast.showToast(
            msg: "Lütfen email adresinizi giriniz!",
            toastLength: Toast.LENGTH_LONG);
        return null;
      }

      if (username.isEmpty) {
        Fluttertoast.showToast(
            msg: "Lütfen adınızı ve soyadınızı giriniz!",
            toastLength: Toast.LENGTH_LONG);
        return null;
      }

      if (password.isEmpty) {
        Fluttertoast.showToast(
            msg: "Lütfen şifrenizi giriniz!", toastLength: Toast.LENGTH_LONG);
        return null;
      }

      // Kullanıcıyı Firebase Auth ile kaydet
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Oluşturulan kullanıcıyı veritabanına kaydet
      Users user = Users(
        userID: userCredential.user!.uid,
        username: username,
        email: email,
        password: password,
      );
      await _usersService.createUser(user, profilePhoto);

      // Başarılı mesajı göster
      Fluttertoast.showToast(
        msg: "Kayıt işlemi başarılı",
      );

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      // Hata mesajını CustomErrorMessage sınıfından al
      String errorMessage = CustomErrorMessage.getRegisterErrorMessage(e.code);
      Fluttertoast.showToast(
          msg: "Uyarı: $errorMessage", toastLength: Toast.LENGTH_LONG);
    }
    return null;
  }

  // Kullanıcının uygulamaya giriş yapmasını sağlar
  Future<String?> signInUser(
      {required String email, required String password}) async {
    try {
      if (email.isEmpty) {
        Fluttertoast.showToast(
            msg: "Lütfen email adresinizi giriniz!",
            toastLength: Toast.LENGTH_LONG);
        return null;
      }

      if (password.isEmpty) {
        Fluttertoast.showToast(
            msg: "Lütfen şifrenizi giriniz!", toastLength: Toast.LENGTH_LONG);
        return null;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Fluttertoast.showToast(
        msg: "Giriş işlemi başarılı",
        toastLength: Toast.LENGTH_SHORT,
      );

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      String errorMessage = CustomErrorMessage.getLoginErrorMessage(e.code);
      Fluttertoast.showToast(
          msg: "Uyarı: $errorMessage", toastLength: Toast.LENGTH_LONG);
    }
    return null;
  }

  // Kullanıcının uygulamadan çıkış yapmasını sağlar
  Future<void> signOutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  // Kullanıcının şifresini sıfırlama isteği gönderir
  Future<void> resetPassword(BuildContext context, String email) async {
    final navigator = Navigator.of(context);
    try {
      if (email.isEmpty) {
        Fluttertoast.showToast(
            msg: "Lütfen e-posta adresinizi giriniz!",
            toastLength: Toast.LENGTH_LONG);
        return;
      }
      await _auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: "E-posta adresinize bir şifre sıfırlama isteği gönderildi",
        toastLength: Toast.LENGTH_LONG,
      );
      navigator.pop();
    } on FirebaseAuthException catch (e) {
      String errorMessage =
          CustomErrorMessage.getForgotPasswordErrorMessage(e.code);
      Fluttertoast.showToast(
          msg: "Uyarı: $errorMessage", toastLength: Toast.LENGTH_LONG);
    }
  }

  //KENDİM EKLEDİM
  Future<void> deleteUser() async {
    try {
      String uid = _auth.currentUser!.uid;

      // Firebase Authentication'dan kullanıcıyı sil
      await _auth.currentUser!.delete();

      // Kullanıcıyı Firestore'dan sil
      await _usersService.deleteUser(uid);

      // Başarılı mesajı göster
      Fluttertoast.showToast(
        msg: "Kullanıcı hesabı başarıyla silindi.",
        toastLength: Toast.LENGTH_LONG,
      );

      // Çıkış yap ve profil sayfasından yönlendir
      await signOutUser();
    } catch (e) {
      print("HATA: ${e.toString()}");
      // Hata mesajını göster
      Fluttertoast.showToast(
        msg: "Kullanıcı hesabını silerken bir hata oluştu.",
        toastLength: Toast.LENGTH_LONG,
      );

      return;
    }
  }

  //KENDİM EKLEDİM
  Future<void> updateUserInformation(
      {required String newEmail,
      required String newPassword,
      required String newUsername,
      File? profilePhoto}) async {
    try {
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        // Kullanıcının Firebase Authentication e-posta ve şifresini güncelle
        await currentUser.updateEmail(newEmail);
        await currentUser.updatePassword(newPassword);

        // Firestore'dan kullanıcının mevcut bilgilerini al
        Users? user = await _usersService.getUser();

        if (user != null) {
          // Kullanıcının Firestore Database bilgilerini güncelle
          user.email = newEmail;
          user.password = newPassword;
          user.username = newUsername;

          await _usersService.updateUser(user, profilePhoto);
        }
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage =
          CustomErrorMessage.getUpdateUserErrorMessage(e.code);
      Fluttertoast.showToast(
          msg: "Uyarı: $errorMessage", toastLength: Toast.LENGTH_LONG);
    }
  }
}
