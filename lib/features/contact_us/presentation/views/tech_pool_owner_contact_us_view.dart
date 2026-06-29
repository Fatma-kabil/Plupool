import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/teh_pool_owner_contact_us_view_body.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';

class TechPoolOwnerContactUsView extends StatefulWidget {
  const TechPoolOwnerContactUsView({super.key, required this.user});
final UserDetailsEntity user;
  @override
  State<TechPoolOwnerContactUsView> createState() => _TechPoolOwnerContactUsViewState();
}

class _TechPoolOwnerContactUsViewState extends State<TechPoolOwnerContactUsView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          appBar: CustomAppBar(
            isSearch: false,
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
          ),
          drawer: AppDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(13),
              vertical: SizeConfig.h(15),
            ),
            child: TehPoolOwnerContactUsViewBody(user: widget.user,),
          ),
        ),
      ),
    );
  }
}