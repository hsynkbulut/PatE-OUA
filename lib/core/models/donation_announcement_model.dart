import 'package:cloud_firestore/cloud_firestore.dart';

class DonationAnnouncement {
  final String? announcementId;
  final DateTime announcementDate;
  final String description;
  final String organizationName;
  final String title;

  DonationAnnouncement(
      {this.announcementId,
      required this.announcementDate,
      required this.description,
      required this.organizationName,
      required this.title});

  // DonationAnnouncement sınıfını Map'e dönüştürme
  Map<String, dynamic> toMap() {
    return {
      'announcementId': announcementId,
      'announcementDate': announcementDate,
      'description': description,
      'organizationName': organizationName,
      'title': title
    };
  }

  // Map'i DonationAnnouncement sınıfına dönüştürme
  DonationAnnouncement.fromMap(Map<String, dynamic> map)
      : announcementId = map['announcementId'],
        announcementDate = (map['announcementDate'] as Timestamp)
            .toDate(), // Timestamp'ı DateTime'a dönüştürme
        description = map['description'],
        organizationName = map['organizationName'],
        title = map['title'];
}
