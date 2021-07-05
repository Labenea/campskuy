import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:campskuy/model/camp_model.dart';
import 'package:campskuy/repository/camp_repos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial());

  @override
  Stream<HomeBlocState> mapEventToState(
    HomeBlocEvent event,
  ) async* {
    if (event is HomePopularLoad) {
      List<CampData> campDat = [];
      yield HomeBlocLoading();
      QuerySnapshot camps = await CampRepo().getPopularCampData();
      print(camps.size);
      camps.docs.forEach((e) {
        campDat.add(CampData(
            title: e.get("title"),
            desc: e.get("desc"),
            image: e.get("image"),
            location: e.get("location"),
            price: e.get("price"),
            str: e.get("str"),
            type: e.get("type"),
            view: e.get("view")));
      });

      yield HomeBlocPopularLoaded(campDat);
    }
  }
}
