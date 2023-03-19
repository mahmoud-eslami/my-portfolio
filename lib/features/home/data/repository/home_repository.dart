import 'package:dio/dio.dart';
import 'package:flutter_portfolio/core/extensions/object_extensions.dart';
import 'package:flutter_portfolio/features/home/data/api/home_api.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';

class HomeRepository {
  final HomeApi _homeApi;

  const HomeRepository(this._homeApi);

  Future<HomeData> fetchHomeData() async {
    try {
      final data = await _homeApi.fetchHomeData();
      return HomeData.fromJson(data);
    } on DioError catch (e) {
      e.log();
      rethrow;
    }
  }
}
