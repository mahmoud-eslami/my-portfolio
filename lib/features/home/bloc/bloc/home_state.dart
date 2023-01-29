part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchHomeDataSuccess extends HomeState {
  final HomeModel homeData;

  FetchHomeDataSuccess(this.homeData);

  @override
  List<Object?> get props => [homeData];
}

class FetchHomeDataFailure extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchHomeDataLoading extends HomeState {
  @override
  List<Object?> get props => [];
}
