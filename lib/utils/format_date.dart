import 'package:intl/intl.dart';

String getFormattedDate(DateTime dateTime) {
  final formattedDate = DateFormat('MMMM d, h:mm a').format(dateTime);
  return formattedDate.toLowerCase();
}
