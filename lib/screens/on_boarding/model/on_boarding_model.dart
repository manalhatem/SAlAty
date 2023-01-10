class OnBoardingModel{
  String img;
  String title;
  String body;

  OnBoardingModel({required this.img, required this.title, required this.body});
}

List<OnBoardingModel> itemsBoard=[
  OnBoardingModel(img: 'assets/images/onboarding_1.png', title: 'Online Shopping',
      body:  'You can shopping anytime, anywhere that you want.'),
  OnBoardingModel(img: 'assets/images/onboarding_2.png', title: 'Mobile Payment', body:
  'Download our shopping application and buy using your smartphone or laptop.'),
  OnBoardingModel(img: 'assets/images/onboarding_3.png', title: 'Delivery Service', body: 'Modern delivering technologies.The products you order will be delivered to your address.')
];