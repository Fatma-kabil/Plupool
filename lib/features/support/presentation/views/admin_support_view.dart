import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/admin_support_view_body.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_card.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_list_shimmer.dart';

class AdminSupportView extends StatefulWidget {
  const AdminSupportView({super.key});

  @override
  State<AdminSupportView> createState() => _AdminSupportViewState();
}

class _AdminSupportViewState extends State<AdminSupportView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  bool isSearching = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactCubit>().getMessages(
        type: "support",
        status: "pending_review",
      );
    });
  }

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

              context.read<ContactCubit>().getMessages(
                search: value,
                type: "support",
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
                ? BlocBuilder<ContactCubit, ContactState>(
                    builder: (context, state) {
                      if (state is ContactLoading) {
                        return CustomScrollView(
                          slivers: [
                            MessagesListShimmer(),
                          ],
                        );
                      }

                      if (state is ContactError) {
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Center(
                                child: ErrorText(message: state.message),
                              ),
                            ),
                          ],
                        );
                      }

                      if (state is ContactSuccess) {
                        final messages = state.response.messages;

                        if (messages.isEmpty) {
                          return const CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Center(
                                  child: Text("📭 لا توجد رسائل"),
                                ),
                              ),
                            ],
                          );
                        }

                        return CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final message = messages[index];

                                  return MessageCard(
                                    message: message,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/messagedetails',
                                        arguments: message,
                                      );
                                    },
                                  );
                                },
                                childCount: messages.length,
                              ),
                            ),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  )
                : const AdminSupportViewBody(),
          ),
        ),
      ),
    );
  }
}