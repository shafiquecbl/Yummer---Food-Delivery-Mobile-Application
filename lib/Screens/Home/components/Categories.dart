import 'package:flutter/cupertino.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/burger 1.png", "text": "Burgers"},
      {"icon": "assets/pizza 1.png", "text": "Pizza"},
      {"icon": "assets/salad 1.png", "text": "Salad"},
      {"icon": "assets/spaghetti 1.png", "text": "Speghetti"},
      {"icon": "assets/burger 1.png", "text": "Burger"},
      {"icon": "assets/salad 1.png", "text": "Salad"},
      {"icon": "assets/spaghetti 1.png", "text": "Speghetti"},
      {"icon": "assets/burger 1.png", "text": "Burger"},
    ];
    return Row(
      children: [
        SingleChildScrollView(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return CategoryCard(
                icon: 'assets/burger 1.png',
                press: () {},
                text: 'Burgers',
              );
            },
          ),
          // Padding(
          //   padding: EdgeInsets.all((20)),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: List.generate(
          //       categories.length,
          //       (index) => CategoryCard(
          //         icon: categories[index]["icon"],
          //         text: categories[index]["text"],
          //         press: () {},
          //       ),

          //     ),

          //   ),
          // ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: (55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all((15)),
              height: (55),
              width: (55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
