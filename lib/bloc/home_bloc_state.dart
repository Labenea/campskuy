part of 'home_bloc_bloc.dart';

abstract class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object> get props => [];
}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoading extends HomeBlocState {}

class HomeBlocPopularLoaded extends HomeBlocState {
  final List<CampData> campData;

  HomeBlocPopularLoaded(this.campData);
}
