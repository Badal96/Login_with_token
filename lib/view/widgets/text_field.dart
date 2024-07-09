import 'package:apricotspace_task/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomTextField extends StatelessWidget {
  final bool obscure;
  final String title;
  final String formControlName;
  final Map<String, String Function(Object)>? validationMessages;
  final InputDecoration? decoration;
  const CustomTextField({
    super.key,
    required this.title,
    required this.formControlName,
    this.validationMessages,
    this.obscure = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final parent = ReactiveForm.of(context, listen: false);
    if (parent == null || parent is! FormControlCollection) {
      throw FormControlParentNotFoundException(this);
    }

    final collection = parent as FormControlCollection;
    final control = collection.control(formControlName);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColors.buttonBlack, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        UISize.smVertical,
        ReactiveTextField(
          onChanged: (value) {
            value.markAllAsTouched();
          },
          obscureText: obscure,
          showErrors: (_) => false,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15),
          formControlName: formControlName,
          validationMessages: validationMessages,
          decoration: decoration ??
              const InputDecoration(
                alignLabelWithHint: false,
              ),
        ),
        StreamBuilder(
          stream: control.touchChanges,
          builder: (context, snapshot) {
            return StreamBuilder(
              stream: control.statusChanged,
              builder: (context, snapshot) {
                if (control.touched && control.invalid && control.hasErrors) {
                  final errorKey = control.errors.keys.first;
                  final validationMessage = _findValidationMessage(errorKey);
                  final errorMsg = validationMessage != null
                      ? validationMessage(control.getError(errorKey)!)
                      : errorKey;
                  return Container(
                      margin: const EdgeInsets.only(top: UISize.halfStandard),
                      child: Text(
                        errorMsg,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              height: 17.5 / 12,
                              color: AppColors.error,
                            ),
                      ));
                }
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ],
    );
  }

  ValidationMessageFunction? _findValidationMessage(String errorKey) {
    if (validationMessages != null && validationMessages!.containsKey(errorKey)) {
      return validationMessages![errorKey];
    }
    return null;
  }
}
