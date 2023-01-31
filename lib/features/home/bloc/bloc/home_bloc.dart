import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:flutter_portfolio/features/home/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeDataFetched>(_homeDataFetched);
  }

  _homeDataFetched(HomeDataFetched event, Emitter emit) async {
    late HomeModel? homeData;
    emit(FetchHomeDataLoading());
    homeData = await repository.getHomePageData();

    if (homeData != null) {
      emit(FetchHomeDataSuccess(homeData));
    } else {
      emit(FetchHomeDataFailure());
    }
  }
}
