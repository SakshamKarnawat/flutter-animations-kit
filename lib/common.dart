import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print("dsgsd");
        Navigator.pop(context);
      },
      child: const Text("Go back to home"),
    );
  }
}
