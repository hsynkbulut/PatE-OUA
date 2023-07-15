// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pat_e/core/models/donation_announcement_model.dart';

class DonationAnnouncementService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Bağış duyurusu oluşturma
  Future createDonationAnnouncement(DonationAnnouncement announcement) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser
              ?.uid) // users koleksiyonundan uid'ye göre bir belge seçme
          .collection('donationannouncements')
          .doc(announcement.announcementId)
          .set(announcement.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  // Bağış duyurusu güncelleme
  Future updateDonationAnnouncement(DonationAnnouncement announcement) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser
              ?.uid) // users koleksiyonundan uid'ye göre bir belge seçme
          .collection('donationannouncements')
          .doc(announcement.announcementId)
          .update(announcement.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  // Bağış duyurusu silme
  Future deleteDonationAnnouncement(String announcementId) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser
              ?.uid) // users koleksiyonundan uid'ye göre bir belge seçme
          .collection('donationannouncements')
          .doc(announcementId)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // Tüm bağış duyurularını getirme
  Future<List<DonationAnnouncement>> getAllDonationAnnouncements() async {
    try {
      QuerySnapshot query = await _firestore
          .collectionGroup('donationannouncements')
          .orderBy('announcementDate')
          .get();
      List<DonationAnnouncement> announcements = query.docs
          .map((doc) =>
              DonationAnnouncement.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return announcements;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // Kullanıcının kendi ilanlarını getiren özel bir fonksiyon
  Future<List<DonationAnnouncement>> getUserDonationAnnouncements() async {
    try {
      String uid = _auth.currentUser!.uid;

      QuerySnapshot query = await _firestore
          .collection('users')
          .doc(uid)
          .collection('donationannouncements')
          .orderBy('announcementDate')
          .get();

      List<DonationAnnouncement> animals = query.docs
          .map((doc) =>
              DonationAnnouncement.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return animals;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
