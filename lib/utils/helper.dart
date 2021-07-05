import 'package:intl/intl.dart';

bool inputValidation(
    DateTime? dob, String? name, String? phone, String? gender) {
  if (dob == null || gender!.isEmpty || name!.isEmpty || phone!.isEmpty) {
    return false;
  } else {
    return true;
  }
}

String formatCurrency(int value) {
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  return currencyFormatter.format(value);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
