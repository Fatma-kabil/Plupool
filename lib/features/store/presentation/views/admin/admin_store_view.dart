import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/store/presentation/cubits/store_statistics_cubit/store_statistics_cubit.dart';
import 'package:plupool/features/store/presentation/views/admin/widgets/admin_store_view_body.dart';

class AdminStoreView extends StatefulWidget {
  const AdminStoreView({super.key});

  @override
  State<AdminStoreView> createState() => _AdminStoreViewState();
}

class _AdminStoreViewState extends State<AdminStoreView> {
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
         body: BlocProvider(
  create: (_) => sl<StoreStatisticsCubit>()..getStoreStatistics(),
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: SizeConfig.w(13),
      vertical: SizeConfig.h(15),
    ),
    child: AdminStoreViewBody(),
  ),
),
        ),
      ),
    );
  }
}