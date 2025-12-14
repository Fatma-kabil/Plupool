import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_datails_view_body.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(17),
            vertical: SizeConfig.h(25),
          ),
          child: SizedBox.expand(
            child: Stack(
              children: [
                ProfileDatailsViewBody(),
                Positioned(
                  bottom: SizeConfig.h(10),
                  left: 0,
                  right: 0,
                  child: EditButton(
                    onPressed: () => context.push('/profileeditview'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
