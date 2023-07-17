import 'package:animations_kit/constants.dart';
import 'package:flutter/material.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(AppConstants.backHome, style: TextStyles.button()),
    );
  }
}
