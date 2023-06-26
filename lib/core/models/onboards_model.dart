class OnBoards {
  final String text, image;

  OnBoards({required this.text, required this.image});
}

List<OnBoards> onBoardData = [
  OnBoards(
      text:
          'Hayvanları seviyorsanız ve onlara yardımcı olmak \nistiyorsanız, doğru yerdesiniz. Uygulamamızı keşfedin \nve hayvanlara destek olmanın keyfini yaşayın!',
      image: "assets/images/dog.png"),
  OnBoards(
      text:
          "İhtiyaç sahibi hayvanları bulun ve \nonlara sevgi dolu bir yuva sağlayın.",
      image: "assets/images/cat.png"),
  OnBoards(
      text:
          "Hayvanlar hakkında daha fazla bilgi edinmek ve \nonlara yardım etmek için bilgilendirici içeriklerimize \ngöz atın.",
      image: "assets/images/rabbit.png"),
];
