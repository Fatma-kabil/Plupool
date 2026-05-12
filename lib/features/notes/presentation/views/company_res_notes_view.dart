import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:plupool/features/notes/presentation/views/widgets/company_res_notes_view_body.dart';

class CompanyResNotesView extends StatefulWidget {
  const CompanyResNotesView({super.key, required this.user});
  final UserDetailsEntity user;

  @override
  State<CompanyResNotesView> createState() => _CompanyResNotesViewState();
}

class _CompanyResNotesViewState extends State<CompanyResNotesView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => sl<NotesCubit>(),
      child: Directionality(
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
                child: CompanyResNotesViewBody(user:widget.user),
              ),
            ),
          ),
        ),
    );
  }
}
