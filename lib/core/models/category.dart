import 'package:pat_e/common/constants/path_constant.dart';

class Category {
  String thumbnail;
  String name;
  String description;

  Category({
    required this.name,
    required this.description,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Hayvan Sahiplenme',
    description:
        'Hayvan sahiplendirmek yada hayvan sahiplenmek isteyenler buraya',
    thumbnail: PathConstant.animalAdoptionImage,
  ),
  Category(
    name: 'Bağış & Destek',
    description: 'Bağış ihtiyacı olanlar ve bağış yapmak isteyenler buraya',
    thumbnail: PathConstant.donationImage,
  ),
  Category(
    name: 'Kayıp İlanı',
    description: 'Kayıp ilanı açmak ve kayıp ilanlarına göz atmak için buraya',
    thumbnail: PathConstant.lostAndFoundImage,
  ),
];
