import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_card.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/customers/presentation/views/widgets/user_shimmer_list.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class CompantResViewBody extends StatefulWidget {
  const CompantResViewBody({super.key});

  @override
  State<CompantResViewBody> createState() =>
      _CompantResViewBodyState();
}

class _CompantResViewBodyState
    extends State<CompantResViewBody> {
  String selected = "نشط";
  String _search = "";

  bool get isSearching => _search.isNotEmpty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersCubit>().getUsers(
            role: "company",
            isActive: true,
          );
    });
  }

  void onSearchChanged(String value) {
    setState(() => _search = value);

    context.read<UsersCubit>().getUsers(
          role: "company",
          search: value.isEmpty ? null : value,
        );
  }

  void onFilterChanged(String val) {
    setState(() => selected = val);

    context.read<UsersCubit>().getUsers(
          role: "company",
          isActive: val == "نشط",
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ابحث عن ممثل الشركة:",
                        style:
                            AppTextStyles.styleSemiBold16(
                          context,
                        ),
                      ),
                      AddOfferBtn(
                        text: "إضافة ممثل شركه",
                        onTap: () {
                          context.push('/addcompanyres');
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
                      hintText:
                          "ابحث باسم ممثل الشركه او رقم الهاتف",
                      onChanged: onSearchChanged,
                    ),
                  ),

                  /// FILTER
                  if (!isSearching)
                    FilterOption(
                      value: selected,
                      items: const [
                        "نشط",
                        "غير نشط",
                      ],
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

            /// 🔄 LOADING
            if (state is UsersLoading)
              const UserShimmerList()

            /// ❌ ERROR
            else if (state is UsersError)
              SliverFillRemaining(
                child: Center(
                  child: ErrorText(
                    message: state.message,
                  ),
                ),
              )

            /// ✅ SUCCESS
            else if (state is UsersSuccess)
              state.users.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(
                        child: ErrorText(
                          message:
                              "لا يوجد ممثلين شركات",
                        ),
                      ),
                    )
                  : SliverList(
                      delegate:
                          SliverChildBuilderDelegate(
                        (context, index) {
                          final user =
                              state.users[index];

                          return Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  SizeConfig.h(12),
                            ),
                            child: CompanyResCard(
                              user: user,
                            ),
                          );
                        },
                        childCount:
                            state.users.length,
                      ),
                    )

            else
              const SliverToBoxAdapter(
                child: SizedBox(),
              ),
          ],
        );
      },
    );
  }
}