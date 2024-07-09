import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  final String asset;
  final String text;
  const Preview({super.key, required this.asset, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  asset,
                ),
                fit: BoxFit.fill),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0.9),
          child: SizedBox(
            width: 300,
            child: Text(
              text,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
