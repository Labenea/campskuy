import 'package:flutter/material.dart';

class CampCardWidget extends StatelessWidget {
  const CampCardWidget({
    Key? key,
    required this.title,
    required this.location,
    required this.price,
    this.ontap,
    required this.image,
  }) : super(key: key);
  final String title;
  final String location;
  final String price;
  final String image;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                image,
                height: 120,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 129,
                    child: Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 17,
                        color: Colors.grey[600],
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        location,
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Rp ${price}",
                        style: TextStyle(
                            color: Colors.red[300],
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " /Night",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
