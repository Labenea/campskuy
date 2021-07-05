import 'package:campskuy/utils/color_utils.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.catTitle, required this.image})
      : super(key: key);

  final String catTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsUtil.primaryGreen,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(18),
        height: 30,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                "images/$image",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              catTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
