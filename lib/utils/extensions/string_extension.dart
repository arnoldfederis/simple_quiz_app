extension StringExtension on String {
  String capitalize() {
    final text = this;
    return text.isNotEmpty
        ? "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}"
        : text;
  }
}
