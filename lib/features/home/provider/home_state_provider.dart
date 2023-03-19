import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:flutter_portfolio/features/home/data/model/home_state.dart';
import 'package:flutter_portfolio/features/home/data/repository/home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeDataNotifier extends StateNotifier<HomeState> {
  final HomeRepository _homeRepository;

  HomeDataNotifier(this._homeRepository) : super(HomeState(data: HomeData())) {
    fetchHomeData();
  }

  Future fetchHomeData() async {
    state = state.copyWith(newLoadingState: true);
    HomeData value = await _homeRepository.fetchHomeData();
    state = state.copyWith(newData: value, newLoadingState: false);
  }
}
