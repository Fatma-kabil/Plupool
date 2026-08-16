import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/company_res/presentation/manager/cubits/company_res_clients_cubit/company_res_clients_state.dart';
import 'package:plupool/features/company_res/presentation/manager/cubits/company_res_clients_cubit/company_rs_clients_cubit.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_clients_card.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/customers/presentation/views/widgets/user_shimmer_list.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class CompanyResClientsViewBody extends StatefulWidget {
  const CompanyResClientsViewBody({super.key, required this.userId});

  final int userId;

  @override
  State<CompanyResClientsViewBody> createState() =>
      _CompanyResClientsViewBodyState();
}

class _CompanyResClientsViewBodyState extends State<CompanyResClientsViewBody> {
  String selected = "نشط";
  String search = "";

  bool get isSearching => search.isNotEmpty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CompanyResClientsCubit>().getClients(
        userId: widget.userId,
        isActive: true,
      );
    });
  }

  void onSearchChanged(String value) {
    setState(() => search = value);

    context.read<CompanyResClientsCubit>().getClients(
      userId: widget.userId,
      search: value.isEmpty ? null : value,
    );
  }

  void onFilterChanged(String val) {
    setState(() => selected = val);

    context.read<CompanyResClientsCubit>().getClients(
      userId: widget.userId,
      isActive: val == "نشط",
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompanyResClientsCubit, CompanyResClientsState>(
      listenWhen: (previous, current) {
        return previous.deleteSuccess != current.deleteSuccess ||
            previous.deleteError != current.deleteError;
      },
      listener: (context, state) {
        if (state.deleteSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم حذف العميل بنجاح",
            isSuccess: true,
          );
        }

        if (state.deleteError != null) {
          showCustomSnackBar(context: context, message: state.deleteError!);
        }
      },
      child: BlocBuilder<CompanyResClientsCubit, CompanyResClientsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ابحث عن العميل:",
                          style: AppTextStyles.styleSemiBold16(context),
                        ),
                        AddOfferBtn(
                          text: "إضافة عميل",
                          onTap: () {
                            context.push(
                              '/addcompanyresclientview',
                              extra: widget.userId,
                            );
                          },
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(4),
                        vertical: SizeConfig.h(20),
                      ),
                      child: CustomSearchPerson(
                        hintText: "ابحث بالاسم أو رقم الهاتف",
                        onChanged: onSearchChanged,
                      ),
                    ),

                    if (!isSearching)
                      FilterOption(
                        value: selected,
                        items: const ["نشط", "غير نشط"],
                        onChanged: (val) {
                          if (val != null) {
                            onFilterChanged(val);
                          }
                        },
                      ),

                    SizedBox(height: SizeConfig.h(20)),
                  ],
                ),
              ),

              /// loading
              if (state.isLoading)
                const UserShimmerList()
              /// error
              else if (state.error != null)
                SliverFillRemaining(
                  child: Center(child: ErrorText(message: state.error!)),
                )
              /// empty
              else if (state.clients.isEmpty)
                const SliverFillRemaining(
                  child: Center(child: ErrorText(message: "لا يوجد عملاء")),
                )
              /// success
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final client = state.clients[index];

                    return Padding(
                      padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                      child: CompanyResClientsCard(
                        client: client,
                        isDeleting: state.isDeleting,
                        onDelete: () {
                          context.read<CompanyResClientsCubit>().deleteClient(
                            userId: widget.userId,
                            clientId: client.id,
                          );
                        },
                      ),
                    );
                  }, childCount: state.clients.length),
                ),
            ],
          );
        },
      ),
    );
  }
}
