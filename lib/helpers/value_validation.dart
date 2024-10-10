class ValueValidation {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? numeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (double.tryParse(value) == null) {
      return 'Insira apenas valores númericos';
    }

    if (double.tryParse(value)! < 0) {
      return 'Insira apenas valores positivos';
    }

    if (double.tryParse(value)! == 0) {
      return 'Insira um valor diferente de zero';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return 'As senhas não coincidem';
    }
    return null;
  }
}
