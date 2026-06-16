import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/company_res/presentation/views/manager/cubits/company_res_clients_cubit/company_rs_clients_cubit.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_clients_view_body.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';

class CompanyResClientsView extends StatefulWidget {
  const CompanyResClientsView({super.key, required this.usr});
  final UserDetailsEntity usr;
  @override
  State<CompanyResClientsView> createState() => _CompanyResClientsViewState();
}
class _CompanyResClientsViewState extends State<CompanyResClientsView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocProvider(
      create: (context) => sl<CompanyResClientsCubit>()
        ..getClients(
          userId: widget.usr.user.id,
        ),
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
              child: CompanyResClientsViewBody(
                userId: widget.usr.user.id,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
