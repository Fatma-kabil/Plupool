import 'package:flutter/material.dart';

class MaintenanceItem extends StatelessWidget {
  const MaintenanceItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon, required this.iconcolor,
  });
  final String label;
  final String value;
  final IconData icon;
  final Color iconcolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 2),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 4),
            Icon(icon, size: 16, color: iconcolor),
          ],
        ),
      ],
    );
  }
}
