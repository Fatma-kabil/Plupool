import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/contact_us_details_view_body.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';

class ContactUsDetailsView extends StatefulWidget {
  const ContactUsDetailsView({super.key});

  @override
  State<ContactUsDetailsView> createState() => _ContactUsDetailsViewState();
}

class _ContactUsDetailsViewState extends State<ContactUsDetailsView> {
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
            child: ContactUsDetailsViewBody(),
          ),
        ),
      ),
    );
  }
}