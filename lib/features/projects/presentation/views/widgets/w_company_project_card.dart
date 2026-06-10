import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';

class WCompanyProjectCard extends StatefulWidget {
  const WCompanyProjectCard({super.key, required this.project});
   final ProjectCardModel project;

  @override
  State<WCompanyProjectCard> createState() => _WCompanyProjectCardState();
}

class _WCompanyProjectCardState extends State<WCompanyProjectCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}