import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/presentation/views/widgets/accept_btn.dart';
import 'package:plupool/features/rating/presentation/views/widgets/delete_rating_btn.dart';

class RejectRow extends StatelessWidget {
  const RejectRow({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       AcceptBtn(id: id,),
        SizedBox(width: SizeConfig.w(12)),
        DeleteRatingBtn(id: id,),
      ],
    );
  }
}
