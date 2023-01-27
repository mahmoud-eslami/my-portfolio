import 'dart:io';

import 'package:flutter/foundation.dart';

String assetsPathGenerator(String path) =>
    kDebugMode && (Platform.isWindows) ? path : "assets/$path";
