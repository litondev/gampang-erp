class UtilValidators {
  /// Validasi field wajib diisi
  static String? required(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  /// Validasi panjang minimal
  static String? minLength(String? value, int min, {String fieldName = "Field"}) {
    if (value == null || value.length < min) {
      return "$fieldName must be at least $min characters";
    }
    return null;
  }

  /// Validasi panjang maksimal
  static String? maxLength(String? value, int max, {String fieldName = "Field"}) {
    if (value != null && value.length > max) {
      return "$fieldName must be at most $max characters";
    }
    return null;
  }

  /// Validasi email
  static String? validateEmail(String? value, {String fieldName = "Email"}) {
    if (value == null || value.isEmpty) return "$fieldName is required";
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return "Invalid $fieldName";
    return null;
  }

  /// Validasi password (min 6 karakter, bisa dikustomisasi)
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < minLength) return "Password must be at least $minLength characters";
    return null;
  }

  /// Validasi numeric
  static String? numeric(String? value, {String fieldName = "Field"}) {
    if (value == null || value.isEmpty) return "$fieldName is required";
    if (!RegExp(r'^\d+$').hasMatch(value)) return "$fieldName must be numeric";
    return null;
  }

  /// Validasi match (misal password dan confirm password)
  static String? match(String? value, String? compareValue, {String fieldName = "Field", String compareFieldName = "Field"}) {
    if (value != compareValue) return "$fieldName does not match $compareFieldName";
    return null;
  }
}
