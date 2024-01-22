import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../form_validators/validation_rule.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField({
    super.key,
    List<ValidationRule>? validationRules,
    InputDecoration? decoration,
    ValueChanged<String>? onChanged,
    FormFieldSetter<String>? onSaved,
    String? initialValue,
    bool? autovalidate = false,
    bool? enabled = true,
    bool? obscureText = false,
    bool? autocorrect = false,
    bool? autofocus = false,
    bool? readOnly = false,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization = TextCapitalization.none,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool? showCursor,
    String? obscuringCharacter = '•',
    int? maxLines = 1,
    int? minLines,
    bool? expands = false,
    int? maxLength,
    bool? maxLengthEnforced = true,
    ValueChanged<String>? onFieldSubmitted,
    List<TextInputFormatter>? inputFormatters,
    double? cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets? scrollPadding = const EdgeInsets.all(20.0),
    bool? enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    bool? enableSuggestions = true,
    bool? showSelectionHandles = false,
  }) : super(
          validator: (value) {
            if (validationRules == null) {
              return null;
            }
            for (var rule in validationRules) {
              if (!rule.validate(value)) {
                return rule.errorMessage;
              }
            }
            return null;
          },
        );
}
