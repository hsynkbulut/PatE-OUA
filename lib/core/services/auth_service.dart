import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pat_e/common/helpers/custom_error_message.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    final navigator = Navigator.of(context);

    if (email.isEmpty) {
      Fluttertoast.showToast(
          msg: "Lütfen email adresinizi giriniz!",
          toastLength: Toast.LENGTH_LONG);
      return;
    }

    if (name.isEmpty) {
      Fluttertoast.showToast(
          msg: "Lütfen tam adınızı giriniz!", toastLength: Toast.LENGTH_LONG);
      return;
    }

    if (password.isEmpty) {
      Fluttertoast.showToast(
          msg: "Lütfen şifrenizi giriniz!", toastLength: Toast.LENGTH_LONG);
      return;
    }

    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await _registerUser(name: name, email: email, password: password);
        Fluttertoast.showToast(
          msg: "Kayıt işlemi başarılı",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade600,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        navigator.pushNamed(RouteConstant.homeScreenRoute);
      }
    } on FirebaseAuthException catch (e) {
      //Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
      String errorMessage = CustomErrorMessage.getRegisterErrorMessage(e.code);
      Fluttertoast.showToast(
          msg: "HATA: $errorMessage", toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    final navigator = Navigator.of(context);

    if (email.isEmpty) {
      Fluttertoast.showToast(
          msg: "Lütfen email adresinizi giriniz!",
          toastLength: Toast.LENGTH_LONG);
      return;
    }

    if (password.isEmpty) {
      Fluttertoast.showToast(
          msg: "Lütfen şifrenizi giriniz!", toastLength: Toast.LENGTH_LONG);
      return;
    }

    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Fluttertoast.showToast(
          msg: "Giriş işlemi başarılı",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade600,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        //navigator.push(MaterialPageRoute(builder: (context) => const Home()));
        navigator.pushNamed(RouteConstant.homeScreenRoute);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = CustomErrorMessage.getLoginErrorMessage(e.code);
      Fluttertoast.showToast(
          msg: "HATA: $errorMessage", toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _registerUser(
      {required String name,
      required String email,
      required String password}) async {
    await userCollection
        .doc()
        .set({"email": email, "name": name, "password": password});
  }

  Future<void> resetPassword(BuildContext context,
      {required String email}) async {
    final navigator = Navigator.of(context);
    try {
      if (email.isEmpty) {
        Fluttertoast.showToast(
            msg: "Lütfen e-posta adresinizi giriniz!",
            toastLength: Toast.LENGTH_LONG);
        return;
      }
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: "E-posta adresinize bir şifre sıfırlama isteği gönderildi",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade600,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      navigator.pop();
    } on FirebaseAuthException catch (e) {
      String errorMessage =
          CustomErrorMessage.getForgotPasswordErrorMessage(e.code);
      Fluttertoast.showToast(
          msg: "HATA: $errorMessage", toastLength: Toast.LENGTH_LONG);
    }
  }
}
