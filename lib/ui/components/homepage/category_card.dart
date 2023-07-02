import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/size.dart';
import 'package:pat_e/core/models/category.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category.name == 'Hayvan Sahiplenme') {
          Navigator.pushNamed(context, RouteConstant.animalAdoptionRoute);
        } else if (category.name == 'Bağış & Destek') {
          Navigator.pushNamed(context, RouteConstant.donationRoute);
        } else if (category.name == 'Kayıp İlanı') {
          Navigator.pushNamed(context, RouteConstant.lostAndFoundRoute);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: gold,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: mainAuxiliaryColor.withOpacity(.2),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
          border: Border.all(
            color: secondaryColor,
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: bgColor,
                      width: 1.0,
                    ),
                  ),
                  child: Image.asset(
                    category.thumbnail,
                    height: kCategoryCardImageSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                category.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: bgColor,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
