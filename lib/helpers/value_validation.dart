import '../utils/messages.dart';

class ValueValidation {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return AppMessages.requiredFieldMessage;
    }
    return null;
  }

  static String? numeric(String? value) {
    if (value == null || value.isEmpty) {
      return AppMessages.requiredFieldMessage;
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return AppMessages.invalidPassword;
    }
    return null;
  }
}
