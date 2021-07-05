import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:campskuy/repository/camp_repos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is OnSearchQuery) {
      List<DocumentSnapshot> list = [];
      yield SearchLoading();
      QuerySnapshot data = await CampRepo().getSearchQuery();
      data.docs.forEach((e) {
        if (e
            .get('title')
            .toString()
            .toLowerCase()
            .contains(event.query.toLowerCase())) {
          list.add(e);
        } else if (e
            .get("type")
            .toString()
            .toLowerCase()
            .contains(event.query.toLowerCase())) {
          list.add(e);
        }
      });
      yield SearchLoaded(list);
    }
  }
}
