import 'validation_rule.dart';

class RequiredValidationRule extends ValidationRule {
  RequiredValidationRule({super.errorMessage = 'This field is required'});

  @override
  bool validate(dynamic value) {
    return value != null && value.toString().isNotEmpty;
  }
}
