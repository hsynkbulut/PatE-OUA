import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/views/animal-adoption/add_pet_adoption_announcement.dart';
import 'package:pat_e/ui/views/animal-adoption/delete_adoption_announcement.dart';
import 'package:pat_e/ui/views/animal-adoption/update_adoption_list.dart';
import 'package:pat_e/ui/views/animal-adoption/view_my_adoption_announcement.dart';
import 'package:pat_e/ui/views/lost-and-found/create_lost_pet_ad.dart';
import 'package:pat_e/ui/views/lost-and-found/delete_lost_pet_ad.dart';
import 'package:pat_e/ui/views/lost-and-found/update_lost_pet_ad_list.dart';
import 'package:pat_e/ui/views/lost-and-found/view_my_lost_pet_ads.dart';

class ReportLostPet extends StatefulWidget {
  const ReportLostPet({super.key});

  @override
  State<ReportLostPet> createState() => _ReportLostPetState();
}

class _ReportLostPetState extends State<ReportLostPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.reportLostPetTitle,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: const [
                SizedBox(height: 60),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Kayıp Talebinde Bulun',
                      style: TextStyle(
                          fontFamily: 'OhChewy',
                          fontSize: 40,
                          color: secondaryColor)),
                  subtitle: Text('Sayfasındasınız',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: bgColor)),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Kayıp İlanı Aç', CupertinoIcons.add,
                      primaryColor, CreateLostPetAd()),
                  itemDashboard('İlan Güncelle', CupertinoIcons.arrow_clockwise,
                      primaryColor, const UpdateLostPetAdList()),
                  itemDashboard('İlan Sil', CupertinoIcons.delete, primaryColor,
                      const DeleteLostPetAd()),
                  itemDashboard('İlan Görüntüle', CupertinoIcons.doc_text_fill,
                      primaryColor, const ViewMyLostPetAds()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 126),
          Container(
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Container(
            color: bgColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDashboard(
      String title, IconData iconData, Color background, Widget page) {
    return InkWell(
      onTap: () {
        // burada ilgili sayfaya yönlendirme kodunu yazın
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        decoration: BoxDecoration(
            color: secondaryColor, //kartların rengi
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: gold.withOpacity(0.9),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: bgColor)), //ikonların rengi
            const SizedBox(height: 20),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: primaryColor)) //kartlarda yazan yazının rengi
          ],
        ),
      ),
    );
  }
}
