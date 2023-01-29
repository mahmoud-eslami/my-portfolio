part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeDataFetched extends HomeEvent {
  @override
  List<Object?> get props => [];
}
