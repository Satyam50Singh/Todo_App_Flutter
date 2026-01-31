class DateUtils {
  // Converts a date string in the format "dd-mm-yyyy" to "yyyy-mm-dd"
  static String formatDate(String rawDate) {
    final parts = rawDate.trim().split('-');

    if (parts.length != 3) {
      throw FormatException('Invalid date format: $rawDate');
    }

    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];

    return '$year-$month-$day';
  }
}
