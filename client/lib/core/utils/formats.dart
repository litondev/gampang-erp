import 'package:intl/intl.dart';

class UtilFormats {
  static String formatCurrency(double value) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return format.format(value);
  }

  static String formatDate(DateTime date, {String pattern = 'dd MMM yyyy'}) {
    final formatter = DateFormat(pattern);
    return formatter.format(date);
  }
}
