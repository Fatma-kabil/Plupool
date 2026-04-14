import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsShimmerList extends StatelessWidget {
  const ProductsShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const _ShimmerCard(),
        childCount: 6,
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE0E0E0),   // أغمق شوية
        highlightColor: const Color(0xFFFFFFFF), // لمعة قوية
        period: const Duration(milliseconds: 900), // أسرع لمعة
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              /// IMAGE
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              const SizedBox(width: 12),

              /// TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 14, color: Colors.white),
                    const SizedBox(height: 10),
                    Container(height: 12, width: 180, color: Colors.white),
                    const SizedBox(height: 10),
                    Container(height: 12, width: 120, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}