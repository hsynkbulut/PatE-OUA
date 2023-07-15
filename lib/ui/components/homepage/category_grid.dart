// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pat_e/core/models/category.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/homepage/category_card.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kategorileri Keşfet",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: primaryColor.withOpacity(.9)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2, // Her satırda 2 öğe göstermek için
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            childAspectRatio: 0.82,
            crossAxisSpacing: 20,
            mainAxisSpacing: 12,
            physics:
                const NeverScrollableScrollPhysics(), // Kaydırma özelliği devre dışı bırakıldı
            children: List.generate(categoryList.length, (index) {
              return CategoryCard(
                category: categoryList[index],
              );
            }),
          ),
        ],
      ),
    );
  }
}
