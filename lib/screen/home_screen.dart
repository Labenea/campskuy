import 'dart:math';

import 'package:campskuy/bloc/home_bloc_bloc.dart';
import 'package:campskuy/screen/detail_screen.dart';
import 'package:campskuy/screen/search_screen.dart';
import 'package:campskuy/utils/color_utils.dart';
import 'package:campskuy/utils/helper.dart';
import 'package:campskuy/widget/camp_card_widget.dart';
import 'package:campskuy/widget/category_card.dart';
import 'package:campskuy/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  HomeBlocBloc homeBlocBloc = HomeBlocBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1.0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1.0),
        title: Center(
            child: Text(
          "Campskuy",
          style: TextStyle(
              color: ColorsUtil.accentGreen, fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder(
          bloc: homeBlocBloc,
          builder: (context, state) {
            if (state is HomeBlocInitial) {
              homeBlocBloc.add(HomePopularLoad());
            } else if (state is HomeBlocLoading) {
              return Column(children: [
                mainBuilder(),
                Center(
                    child: SpinKitFadingCube(
                  size: 40,
                  color: ColorsUtil.accentGreen,
                ))
              ]);
            } else if (state is HomeBlocPopularLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  mainBuilder(),
                  Container(
                    height: 250,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.campData.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CampCardWidget(
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            campData: state.campData[i],
                                            rating: Random().nextInt(3) + 2)));
                              },
                              title: state.campData[i].title,
                              location: state.campData[i].location,
                              price: formatCurrency(
                                  int.parse(state.campData[i].price)),
                              image: state.campData[i].image,
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                  ),
                  Container(
                    height: 135,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                            query: "Glamping",
                                          )));
                            },
                            child: CategoryCard(
                              catTitle: "Glamping",
                              image: "hut.png",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                            query: "Camping",
                                          )));
                            },
                            child: CategoryCard(
                              catTitle: "Camping",
                              image: "camp.png",
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return mainBuilder();
          },
        ),
      ),
    );
  }

  Padding mainBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(
            searchController: _searchController,
            onSubmit: (val) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScreen(
                            query: val,
                          )));
            },
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Popular Places",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.green[700]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
