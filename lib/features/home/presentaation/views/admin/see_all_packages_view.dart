import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/admin_packaes_card.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/see_all_packages_view_body.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';
import 'package:plupool/features/packages/presentation/views/widgets/packages_shimmer_list.dart';

class SeeAllPackagesView extends StatefulWidget {
  const SeeAllPackagesView({super.key});

  @override
  State<SeeAllPackagesView> createState() => _SeeAllPackagesViewState();
}

class _SeeAllPackagesViewState extends State<SeeAllPackagesView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  bool isSearching = false;


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          drawer: const AppDrawer(),

          appBar: CustomAppBar(
            isSearch: true,
            onChanged: (value) {
              setState(() {
                isSearching = value.trim().isNotEmpty;
              });

              context.read<PackagesCubit>().getPackages(
                search: value.trim().isEmpty ? null : value,
              );
            },
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(13),
              vertical: SizeConfig.h(15),
            ),

            child: isSearching
                ? BlocBuilder<PackagesCubit, PackagesState>(
                    builder: (context, state) {
                      /// Loading
                      if (state is PackagesLoading) {
                        return const PackagesShimmerList();
                      }

                      /// Error
                      if (state is PackagesError) {
                        return Center(child: ErrorText(message: state.message));
                      }

                      /// Success
                      if (state is PackagesSuccess) {
                        final packages = state.response.packages;

                        final List<Map<String, dynamic>> subscribers = [];

                        for (final package in packages) {
                          for (final subscriber in package.subscribers) {
                            subscribers.add({
                              "subscriber": subscriber,
                              "packageName": package.nameAr,
                              "status": package.status,
                            });
                          }
                        }

                        if (subscribers.isEmpty) {
                          return const Center(child: Text("📭 لا توجد نتائج"));
                        }

                        return ListView.builder(
                          itemCount: subscribers.length,
                          itemBuilder: (context, index) {
                            final subscriber = subscribers[index]["subscriber"];

                            final packageName =
                                subscribers[index]["packageName"] as String;

                            final status =
                                subscribers[index]["status"] as String? ?? "";

                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: SizeConfig.h(15),
                              ),
                              child: AdminPackaesCard(
                                request: subscriber,
                                packageName: packageName,
                                status: status,
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  )
                /// 👇 الوضع الطبيعي
                : const SeeAllPackagesViewBody(),
          ),
        ),
      ),
    );
  }
}
