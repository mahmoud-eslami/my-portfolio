import 'package:flutter/foundation.dart';

String assetsPathGenerator(String path) => kDebugMode ? path : "assets/$path";
