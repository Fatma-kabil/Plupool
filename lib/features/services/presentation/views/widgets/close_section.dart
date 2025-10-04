import 'package:flutter/material.dart';

class CloseSection extends StatelessWidget {
  const CloseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("إغلاق"),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
