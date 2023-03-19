import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/constant/strings.dart';

class HomeApi {
  Future<Map<String, dynamic>> fetchHomeData() async {
    try {
      final dio = Dio();
      final response = await dio.get(
          '${Strings.apiPath}/resume/hide-contribute/portfolio/portfolio.json');
      return json.decode(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
