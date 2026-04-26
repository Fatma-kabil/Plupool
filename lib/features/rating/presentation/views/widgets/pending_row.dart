import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/presentation/views/widgets/accept_btn.dart';

class PendingRow extends StatelessWidget {
  const PendingRow({super.key, required this.id});
final int id;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      AcceptBtn(id: id,),
      SizedBox(width: SizeConfig.w(12),),
      Container(
        padding: EdgeInsets.all(SizeConfig.w(6)),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffFAD7DA),
        ),
        child: Icon(
          Icons.close,
          color: Color(0xffE63946),
          size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(22),
        ),
      ),
    ]);
  }
}
