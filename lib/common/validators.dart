String? validateEmail({required String? value}) {
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword({required String? value}) {
  if (value == null || value.isEmpty) {
    return 'Please enter password';
  }
  return null;
}
