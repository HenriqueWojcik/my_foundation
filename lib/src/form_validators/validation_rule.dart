abstract class ValidationRule {
  String? errorMessage;
  bool validate(dynamic value);
}
