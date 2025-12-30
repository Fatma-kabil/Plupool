import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerAvatar extends StatelessWidget {
  const CustomerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: SizeConfig.w(15),
      backgroundImage:
          const AssetImage('assets/images/user1.png'),
    );
  }
}
