import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/users_state.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/customers/presentation/views/widgets/user_shimmer_list.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_view_body_card_header.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/techs_view_body_card.dart';

class TechsViewBody extends StatefulWidget {
  const TechsViewBody({super.key});

  @override
  State<TechsViewBody> createState() => _TechsViewBodyState();
}

class _TechsViewBodyState extends State<TechsViewBody> {
  String selected = "نشط";
  String _search = "";

  bool get isSearching => _search.isNotEmpty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersCubit>().getUsers(
            role: "technician",
            isActive: true,
          );
    });
  }

  void onSearchChanged(String value) {
    setState(() => _search = value);

    context.read<UsersCubit>().getUsers(
          role: "technician",
          search: value.isEmpty ? "" : value,
        );
  }

  void onFilterChanged(String val) {
    setState(() => selected = val);

    context.read<UsersCubit>().getUsers(
          role: "technician",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TechViewBodyCardHeader(),
                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ابحث عن الفني:",
                        style: AppTextStyles.styleSemiBold16(context),
                      ),
                      AddOfferBtn(
                        text: "إضافة فني",
                        onTap: () {
                          context.push('/addtechview');
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
                      hintText: "ابحث بأسم الفني او رقم الهاتف",
                      onChanged: onSearchChanged,
                    ),
                  ),

                  if (!isSearching)
                    FilterOption(
                      value: selected,
                      items: const ["غير نشط", "نشط"],
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

            /// 🔄 loading
            if (state is UsersLoading)
              UserShimmerList()

            /// ❌ error
            else if (state is UsersError)
              SliverFillRemaining(
                child: Center(
                  child: ErrorText(message: state.message),
                ),
              )

            /// ✅ success
            else if (state is UsersSuccess)
              state.users.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(
                        child: ErrorText(
                          message: "لا يوجد فنيين",
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final user = state.users[index];

                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: SizeConfig.h(12),
                            ),
                            child: TechsViewBodyCard(
                              user: user,
                            ),
                          );
                        },
                        childCount: state.users.length,
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