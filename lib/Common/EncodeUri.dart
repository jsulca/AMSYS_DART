class EncodeUri {
  static String encode(Map<String, dynamic> queryParams) {
    return queryParams.entries.map((entry) {
      if (entry.value == null) return '';
      final key = Uri.encodeComponent(entry.key);
      final value = Uri.encodeComponent(entry.value.toString());
      return '$key=$value';
    }).join('&');
  }

  static String encodeWithNotNulls(Map<String, dynamic> queryParams) {
    final Map<String, dynamic> result = {};

    queryParams.forEach((key, value) {
      if (value != null) result[key] = value;
    });

    return result.entries.map((entry) {
      if (entry.value == null) return '';
      final key = Uri.encodeComponent(entry.key);
      final value = Uri.encodeComponent(entry.value.toString());
      return '$key=$value';
    }).join('&');
  }
}
