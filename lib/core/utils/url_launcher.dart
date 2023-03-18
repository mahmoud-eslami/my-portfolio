import 'package:url_launcher/url_launcher.dart';

Future<void> launchTheUrl(String url) async {
  final Uri url0 = Uri.parse(url);
  if (!await launchUrl(url0)) {
    throw Exception('Could not launch $url0');
  }
}
