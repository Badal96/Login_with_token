import 'package:apricotspace_task/config/theme.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool expands;
  final Widget? suffix;
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.suffix,
    this.expands = true,
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
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.appWhite,
          side: const BorderSide(color: AppColors.buttonBlack),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (suffix != null) ...[suffix!, UISize.smHorizontal],
            Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonBlack,
                    ),
              ),
            ),
          ],
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
