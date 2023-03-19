import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeApi {
  Future<Map<String, dynamic>> fetchHomeData() async {
    try {
      const String baseUrl = 'https://raw.githubusercontent.com/mahmoud-eslami';
      final response = await http.get(Uri.parse(
          '$baseUrl/resume/hide-contribute/portfolio/portfolio.json'));

      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}