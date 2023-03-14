import 'package:flutter_portfolio/core/services/api_service/api_service.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';


class HomeDataSource {
  final ApiService apiService;

  HomeDataSource(this.apiService);

  Future<HomeModel?> getHomeDataFromDataSource() async {
    late HomeModel? homeModel;
    try {
      Map<String, dynamic> dataset = await apiService.getHomeData();
      homeModel = HomeModel.fromJson(dataset);
    } catch (e) {
      homeModel = null;
    }

    return homeModel;
  }
}
