import 'package:campskuy/model/camp_model.dart';
import 'package:campskuy/utils/color_utils.dart';
import 'package:campskuy/utils/helper.dart';
import 'package:campskuy/widget/main_button.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.campData, required this.rating})
      : super(key: key);
  final CampData campData;
  final int rating;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.campData.toJson());
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                widget.campData.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.campData.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: getRating(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rp ${formatCurrency(int.parse(widget.campData.price))} /Night",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrange[400]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.fastfood,
                          size: 35,
                          color: ColorsUtil.primaryGreen,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.wifi,
                          size: 35,
                          color: ColorsUtil.primaryGreen,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.tv,
                          size: 35,
                          color: ColorsUtil.primaryGreen,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.pool,
                          size: 35,
                          color: ColorsUtil.primaryGreen,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.campData.desc,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Other : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getStr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: MainButton(
                            title: "Book Now",
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          padding: EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  List<Widget> getRating() {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    for (int i = 0; i < widget.rating; i++) {
      list.add(Icon(Icons.star,
          color:
              Colors.green[500])); //add any Widget in place of Text("Index $i")
    }
    for (int i = 0; i < 5 - widget.rating; i++) {
      list.add(Icon(Icons.star,
          color: Colors.black)); //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }

  List<Widget> getStr() {
    List<Widget> list = [];
    widget.campData.str.split(",").forEach((element) {
      list.add(Text("- ${element.capitalize()}"));
    });
    return list;
  }
}
