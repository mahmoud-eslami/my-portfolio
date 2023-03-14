import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService{
  static const String _baseUrl = 'https://raw.githubusercontent.com/mahmoud-eslami';
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

 Future<Map<String,dynamic>> getHomeData() async {
   Map<String,dynamic>? data;
   try{
     final response = await http.get(Uri.parse('$_baseUrl/resume/main/portfolio/portfolio.json'));

     if (response.statusCode == 200) {
       return json.decode(response.body);
     } else {
       throw Exception('Failed to load data');
     }
   }catch(e,s){
        if (kDebugMode) {
          print("Error: $e, StackTrace: $s");
        }
   }

   return data!;

 }
}