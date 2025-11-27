class AppValidator {
  AppValidator._();

  static String? ValidEmail(String? email) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "Email is required";
    }
    if (emailRegex.hasMatch(email) == false) {
      return "Invalid email";
    } else {
      return null;
    }
  }
}
