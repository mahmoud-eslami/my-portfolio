import 'package:flutter_portfolio/features/home/data/model/home_model.dart';

import '../../../../core/database/data.dart';

class HomeDataSource {
  Future<HomeModel?> getHomeDataFromDataSource() async {
    late HomeModel? homeModel;
    try {
      homeModel = HomeModel.fromJson(dataset);
    } catch (e) {
      homeModel = null;
    }

    return homeModel;
  }
}
