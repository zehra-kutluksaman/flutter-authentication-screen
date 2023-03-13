import 'package:authentication/homescreen.dart';
import 'package:authentication/logout.dart';
import 'package:authentication/usermodel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> createUser(
    UserModel userModel,
    String password,
  ) async {
    try {
      User? user = (await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: userModel.email!,
        password: password,
      )
          .then((value) async {
        userModel.userId = value.user!.uid;
        _firebaseAuth.currentUser!.sendEmailVerification();

        await _firestore.collection("users").doc(userModel.userId).set({
          "username": userModel.username,
          "phone": userModel.phone,
          "email": userModel.email,
          "token": userModel.token
        });
        //_firebaseAuth.currentUser!.sendEmailVerification();
      }));
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Başarılı',
        'Kayıt başarıyla yapıldı.',
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.pink,
        icon: const Icon(Icons.add_task),
      );
    }
  }

  Future<User?> logIn(String email, String password) async {
    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null && _firebaseAuth.currentUser!.emailVerified) {
        Get.snackbar(
          'Başarılı',
          'Giriş Başarıyla yapıldı',
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.pink,
          icon: const Icon(Icons.add_task),
        );
        debugPrint("Login Succesfull.");

        Get.offAll(const LogOut());
        return user;
      } else {
        debugPrint("Login Failed.");
      }
    } catch (e) {
      Get.snackbar(
        'Hata',
        'Böyle bir kullanıcı yok',
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.pink,
        icon: const Icon(Icons.add_task),
      );
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  logOut() async {
    try {
      await _firebaseAuth
          .signOut()
          .then((value) => Get.offAll(const HomeScreen()));
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

//login succesfull if komutunun içine yazılıyor verify için
//&& _firebaseAuth.currentUser!.emailVerified