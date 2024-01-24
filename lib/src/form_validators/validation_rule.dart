abstract class ValidationRule {
  ValidationRule({
    this.errorMessage,
  });

  final String? errorMessage;

  bool validate(dynamic value);
}
