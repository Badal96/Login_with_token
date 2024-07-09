import 'package:apricotspace_task/config/theme.dart';
import 'package:apricotspace_task/view/widgets/loading.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool expands;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.expands = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = Container(
      height: 44,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.buttonBlack.withOpacity(0.1),
          offset: const Offset(0, 1),
          blurRadius: 3.6,
        )
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.disabled,
          backgroundColor: AppColors.buttonBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const SizedBox(
                height: 34,
                width: 34,
                child: Loading(
                  color: AppColors.appWhite,
                ),
              )
            : Text(
                label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.appWhite,
                    ),
              ),
      ),
    );
    if (expands) {
      button = FractionallySizedBox(
        widthFactor: 1,
        child: button,
      );
    }
    return button;
  }
}
