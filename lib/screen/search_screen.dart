import 'dart:math';

import 'package:campskuy/bloc/search_bloc.dart';
import 'package:campskuy/model/camp_model.dart';
import 'package:campskuy/screen/detail_screen.dart';
import 'package:campskuy/utils/color_utils.dart';
import 'package:campskuy/utils/helper.dart';
import 'package:campskuy/widget/horizontal_card_widget.dart';
import 'package:campskuy/widget/reverse_search_bar.dart';
import 'package:campskuy/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, this.query}) : super(key: key);
  final String? query;
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc searchBloc = SearchBloc();
  TextEditingController searchController = TextEditingController();
  String _query = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocBuilder(
        bloc: searchBloc,
        builder: (context, state) {
          if (state is SearchInitial) {
            if (widget.query != null) {
              searchBloc.add(OnSearchQuery(widget.query!));
            } else {}
          } else if (state is SearchLoaded) {
            return Column(
              children: [
                mainBuilder(),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: HorizontalCard(
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            campData: CampData(
                                                title:
                                                    state.data[i].get("title"),
                                                desc: state.data[i].get("desc"),
                                                image:
                                                    state.data[i].get("image"),
                                                location: state.data[i]
                                                    .get("location"),
                                                price:
                                                    state.data[i].get("price"),
                                                str: state.data[i].get("str"),
                                                type: state.data[i].get("type"),
                                                view:
                                                    state.data[i].get("view")),
                                            rating: Random().nextInt(3) + 2)));
                              },
                              title: state.data[i].get("title"),
                              location: state.data[i].get("location"),
                              price: formatCurrency(
                                  int.parse(state.data[i].get("price"))),
                              image: state.data[i].get("image")),
                        );
                      }),
                )
              ],
            );
          } else if (state is SearchLoading) {
            return Column(
              children: [
                mainBuilder(),
                Expanded(
                  child: Center(
                    child: SpinKitFadingCube(
                      color: ColorsUtil.primaryGreen,
                      size: 50,
                    ),
                  ),
                )
              ],
            );
          }
          return mainBuilder();
        },
      ),
    ));
  }

  Column mainBuilder() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBarReverse(
            searchController: searchController,
            onSubmit: (val) {
              setState(() {
                _query = val;
              });
              searchBloc.add(OnSearchQuery(val));
            },
            query: getQueryVal(),
          ),
        )
      ],
    );
  }

  String? getQueryVal() {
    if (_query.isEmpty) {
      return widget.query;
    } else {
      return _query;
    }
  }
}
