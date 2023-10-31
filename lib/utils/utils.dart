class Utils {
  static String formatDateTime(DateTime date) {
    return "${date.day} - ${date.month} - ${date.year}";
  }

  static String formatDateTimeService(DateTime date) {
    String dia = date.day > 9 ? date.day.toString() : "0${date.day}";
    String mes = date.month > 9 ? date.month.toString() : "0${date.month}";
    return "${date.year}-$mes-$dia";
  }
}
