import 'package:chat_app/app/app.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launches the given [url] in the default browser.
Future<void> launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw Exception('Could not launch $url');
  }
}

/// Launches the email app.
Future<void> launchEmail(BuildContext context) async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  final subject = context.l10n.emailSubject;

  final emailLaunchUri = Uri(
    scheme: 'mailto',
    path: kSupportEmail,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
    }),
  );

  try {
    await launchUrl(emailLaunchUri);
  } catch (e) {
    throw Exception('Could not launch email');
  }
}
