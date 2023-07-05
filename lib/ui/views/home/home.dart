import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:pat_e/common/constants/path_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/components/homepage/category_grid.dart';
import 'package:pat_e/ui/components/sidemenu.dart';
import 'package:pat_e/common/helpers/today_date.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const AssetImage(
        PathConstant.animalAdoptionCarousel,
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            carouselColor1.withOpacity(1),
            mainAuxiliaryColor.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'Hayvan sahiplen & sahiplendir!',
      titleTextStyle: const TextStyle(fontSize: 12, color: bgColor),
      leftSubtitle: TodayDate().formattedDateTime,
      leftSubtitleTextStyle: const TextStyle(
          fontSize: 12, color: bgColor, fontWeight: FontWeight.bold),
      rightSubtitle: 'Hayvan Sahiplenme',
      rightSubtitleTextStyle: const TextStyle(
          fontSize: 12, color: bgColor, fontWeight: FontWeight.bold),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        PathConstant.donationCarousel,
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            carouselColor2.withOpacity(1),
            mainAuxiliaryColor.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'Bağış yardım talebinde bulunabilir veya bağış yapabilirsin',
      titleTextStyle: const TextStyle(fontSize: 12, color: bgColor),
      leftSubtitle: TodayDate().formattedDateTime,
      leftSubtitleTextStyle: const TextStyle(
          fontSize: 12, color: bgColor, fontWeight: FontWeight.bold),
      rightSubtitle: 'Bağış & Destek',
      rightSubtitleTextStyle: const TextStyle(
          fontSize: 12, color: bgColor, fontWeight: FontWeight.bold),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        PathConstant.lostAndFoundCarousel,
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            carouselColor3.withOpacity(1),
            mainAuxiliaryColor.withOpacity(.3),
          ],
          stops: const [0.0, 2.0],
        ),
      ),
      title:
          'Kayıp ilan başvurusunda bulunabilir veya kayıp ilanlarına \ngöz atabilirsin',
      titleTextStyle: const TextStyle(fontSize: 12, color: bgColor),
      leftSubtitle: TodayDate().formattedDateTime,
      leftSubtitleTextStyle: const TextStyle(
          fontSize: 12, color: bgColor, fontWeight: FontWeight.bold),
      rightSubtitle: 'Kayıp İlanı',
      rightSubtitleTextStyle: const TextStyle(
          fontSize: 12, color: bgColor, fontWeight: FontWeight.bold),
      onImageTap: (i) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: const CustomAppBar(showBackButton: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  CustomCarouselSlider(
                    items: itemList,
                    height: 160,
                    subHeight: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    autoplay: true,
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: const [
                    SizedBox(height: 10),
                    CategoryGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
