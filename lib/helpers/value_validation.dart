class ValueValidation {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira um valor';
    }
    return null;
  }

  static String? numeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira um valor';
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
}
