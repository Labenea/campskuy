part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnSearchQuery extends SearchEvent {
  final String query;

  OnSearchQuery(this.query);
}
