import 'package:url_launcher/url_launcher.dart';

/// Launches the given [url] in the default browser.
Future<void> launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw Exception('Could not launch $url');
  }
}
