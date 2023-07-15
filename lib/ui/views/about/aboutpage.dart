import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/components/sidemenu.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDD00).withOpacity(0.8),
      appBar: const CustomAppBar(
        showBackButton: false,
        pageTitle: AppConstant.aboutTitle,
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 350.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.yellow[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/paw-icons.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Uygulama Hakkında',
                      style: TextStyle(
                        fontFamily: 'OhChewy',
                        fontSize: 30.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Hayvan Dostu uygulamamıza hoş geldiniz! Amacımız, hayvanlara sevgi dolu bir yuva bulmalarında ve kaybolan hayvanların sahiplerine kavuşmalarında sizlere yardımcı olmaktır.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Hayvan Sahiplenme kategorisinde, barınaklarda ve sahiplendirme platformlarında bulunan harika dostlarımızın bilgilerini görüntüleyebilirsiniz. Her bir hayvanın detaylı bilgilerini, fotoğraflarını ve sahiplendirme koşullarını inceleyebilirsiniz. İlgi duyduğunuz hayvanlar için başvuruda bulunabilir ve sahiplendirme sürecini adım adım takip edebilirsiniz. Siz de bir hayvanın hayatını değiştirmek için adım atabilirsiniz!',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Kayıp ve Bulunan Hayvanlar kategorisinde ise kaybolan hayvanlar için ilanlar oluşturabilir veya bulunan hayvanlar için ilanları görebilirsiniz. Fotoğraflar, son görüldükleri yerler ve irtibat bilgileri gibi detaylı bilgilerle kaybolan hayvanların sahiplerine ulaşmanıza veya bulunan hayvanlara yeni bir yuva sağlamanıza yardımcı olabiliriz.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Pat-E uygulaması, hayvan severlerin bir araya gelmesini ve hayvanlara sevgi dolu bir yaşam sunmayı amaçlamaktadır. Siz de bu büyülü dünyaya katılın ve hayvanlara umut veren bir yolculuğa çıkın!',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Uygulamamızı kullanarak, sevgi dolu dostlarımıza yeni bir yuva bulmada ve kaybolan hayvanların sahiplerine kavuşmada önemli bir rol oynayabilirsiniz. Unutmayın, her bir hayvan sevgiye ve ilgiye layıktır. Hayvan Dostu uygulaması olarak, hayvanların sesi olmak için buradayız.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: mainAuxiliaryColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Sevgi ve dostlukla dolu bir yolculuğa hazır olun!',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: mainAuxiliaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
