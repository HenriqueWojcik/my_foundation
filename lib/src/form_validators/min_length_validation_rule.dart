import 'validation_rule.dart';

class MinLengthValidationRule extends ValidationRule {
  final int minLength;

  MinLengthValidationRule({
    required this.minLength,
    String? errorMessage,
  }) : super(errorMessage: errorMessage ?? 'Minimum length is $minLength');

  @override
  bool validate(dynamic value) {
    return value != null && value.toString().length >= minLength;
  }
}
