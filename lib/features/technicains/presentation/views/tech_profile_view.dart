import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/technicains/presentation/manager/tech_rating_cubit/tech_rating_cubit.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_profile_view_body.dart';

class TechProfileView extends StatefulWidget {
  const TechProfileView({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<TechProfileView> createState() => _TechProfileViewState();
}

class _TechProfileViewState extends State<TechProfileView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocProvider(
      create: (_) => sl<TechRatingCubit>(),

      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            context.pop(true);
          }
        },

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              key: scaffoldkey,

              appBar: CustomAppBar(
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
                child: TechProfileViewBody(
                  id: widget.id,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}