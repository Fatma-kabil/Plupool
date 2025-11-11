import 'package:flutter/material.dart';

class ServiceRequestHeader extends StatelessWidget {
  const ServiceRequestHeader({super.key, required this.title, required this.stutscolor, required this.stuts, required this.textcolor, });
final String title;
final Color stutscolor;
final String stuts;
final Color textcolor;

  @override
  Widget build(BuildContext context) {
     
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
          title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: stutscolor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            stuts,
            style:  TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: textcolor,
            ),
          ),
        ),
      ],
    );
  }
  }
