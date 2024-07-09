import 'package:apricotspace_task/config/theme.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color color;
  const Loading({
    super.key,
    this.color = AppColors.buttonBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(UISize.halfStandard),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }
}
