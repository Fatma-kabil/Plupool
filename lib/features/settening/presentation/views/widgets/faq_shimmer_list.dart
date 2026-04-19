import 'package:flutter/material.dart';
import 'faq_shimmer_card.dart';

class FaqShimmerList extends StatelessWidget {
  const FaqShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, __) => const FaqShimmerCard(),
    );
  }
}