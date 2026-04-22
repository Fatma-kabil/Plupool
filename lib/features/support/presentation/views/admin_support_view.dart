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

              context.read<ContactCubit>().getMessages(search: value);
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
                        return MessagesListShimmer();
                      }

                      if (state is ContactError) {
                        return Center(child: ErrorText(message:  state.message));
                      }

                      if (state is ContactSuccess) {
                        final messages = state.messages;

                        if (messages.isEmpty) {
                          return const Center(
                            child: Text("📭 لا توجد رسائل"),
                          );
                        }

                        return ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];

                            return MessageCard(
                              message: message,
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/messagedetails',
                                arguments: message,
                              ),
                            );
                          },
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