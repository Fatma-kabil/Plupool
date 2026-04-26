import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/presentation/views/widgets/accept_btn.dart';
import 'package:plupool/features/rating/presentation/views/widgets/reject_btn.dart';

class PendingRow extends StatelessWidget {
  const PendingRow({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AcceptBtn(id: id),
        SizedBox(width: SizeConfig.w(12)),
        RejectBtn(id: id),
      ],
    );
  }
}
