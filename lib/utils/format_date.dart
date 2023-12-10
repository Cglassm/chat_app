import 'package:intl/intl.dart';

/// Returns a formatted date string from a [DateTime] object.
String getFormattedDate(DateTime dateTime) {
  final formattedDate = DateFormat('MMMM d, h:mm a').format(dateTime);
  return formattedDate.toLowerCase();
}
