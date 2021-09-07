import '../../Images.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Find The Restaurant!',
      image: OnBoarding1,
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
  UnbordingContent(
      title: 'Choose Favorite Dishes! ',
      image: OnBoarding2,
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
  UnbordingContent(
      title: 'Get Your Food Delivery!',
      image: OnBoarding3,
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
];
