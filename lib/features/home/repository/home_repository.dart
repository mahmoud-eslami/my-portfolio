import 'package:flutter_portfolio/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';

class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  Future<HomeModel?> getHomePageData() async {
    return _homeDataSource.getHomeDataFromDataSource();
  }
}
