import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pat_e/core/utils/themes/const.dart';
import 'package:pat_e/core/models/onboards_model.dart';
import 'package:pat_e/ui/views/home/home.dart';
import 'package:pat_e/ui/views/startup/signin_page.dart';
import 'package:pat_e/ui/widgets/bottomnavbar.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            color: white,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardData.length,
                itemBuilder: (context, index) => OnBoardContent(
                      onBoard: onBoardData[index],
                    )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                  (route) => false);
            },
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: purple,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 3),
                          color: purple2,
                          spreadRadius: 0,
                          blurRadius: 5)
                    ]),
                child: Center(
                  child: Text(
                    currentPage == onBoardData.length - 1
                        ? 'Giriş Yap'
                        : 'Devam Et',
                    style: poppins.copyWith(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  onBoardData.length, (index) => indicator(index: index))
            ],
          )
        ],
      ),
    );
  }

  AnimatedContainer indicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: currentPage == index ? 20 : 6,
      height: 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: currentPage == index ? purple : black.withOpacity(0.6)),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  final OnBoards onBoard;
  const OnBoardContent({Key? key, required this.onBoard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 40,
                    color: purple2,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 70,
                          left: -45,
                          height: 150,
                          width: 150,
                          child: Transform.rotate(
                              angle: -11.5,
                              child: SvgPicture.asset(
                                'assets/Paw_Print.svg',
                                color: purple2.shade400,
                              )),
                        ),
                        Positioned(
                          bottom: 77,
                          right: -30,
                          height: 150,
                          width: 150,
                          child: Transform.rotate(
                              angle: 67,
                              child: SvgPicture.asset(
                                'assets/Paw_Print.svg',
                                color: purple2.shade400,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 10,
                  child: Image.asset(
                    onBoard.image,
                    height: 350,
                  ))
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text.rich(
          TextSpan(
              style: poppins.copyWith(
                  height: 1.2,
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
              children: [
                TextSpan(text: 'Hayalinizdeki ', style: poppins),
                TextSpan(text: 'Evcil\n', style: poppins.copyWith(color: gold)),
                TextSpan(text: 'Hayvanı Burada Bulun', style: poppins),
              ]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          onBoard.text,
          textAlign: TextAlign.center,
          style: poppins.copyWith(color: black.withOpacity(0.6)),
        )
      ],
    );
  }
}
