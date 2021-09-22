class ProductContent {
  String image;
  String title;
  String discription;

  ProductContent(
      {required this.image, required this.title, required this.discription});
}

List<ProductContent> contents = [
  ProductContent(
      title: 'Find The Restaurant!',
      image: 'assets/grill.jpg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
  ProductContent(
      title: 'Choose Favorite Dishes! ',
      image: 'assets/grill.jpg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
  ProductContent(
      title: 'Get Your Food Delivery!',
      image: 'assets/grill.jpg',
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "),
];
