import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/search/presentation/views/widgets/custom_search_text_field.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.onPressed, this.isSearch = false});
  final void Function()? onPressed;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.only(
        left: SizeConfig.w(15),
        //  right: SizeConfig.w(15),
        top: SizeConfig.h(20),
      ),
      // margin:EdgeInsets.symmetric(vertical: SizeConfig.h(10)) ,
      //    color: Colors.black, // غيريه حسب الثيم
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// ☰ منيو (يمين – RTL)
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.w(8)),
            child: IconButton(
              icon: Icon(
                Icons.menu_sharp,
                color: Color(0xff777777),
                size: SizeConfig.w(22),
              ),
              onPressed: onPressed,
            ),
          ),

          /// 🔍 Search
          if (isSearch) ...[
          SizeConfig.isWideScreen? SizedBox(width: SizeConfig.w(10)):SizedBox(width: SizeConfig.w(0)),
            Expanded(child: CustumSearchTextField()),
            SizedBox(width: SizeConfig.w(20)),
          ],

          /// 🔔 أيقونة شمال
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: AppColors.kprimarycolor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () =>  context.go('/adminsettingview'),
                  child: Icon(
                    Icons.settings,
                    color: AppColors.kprimarycolor,
                    size: SizeConfig.w(16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(  SizeConfig.isWideScreen ? SizeConfig.h(80) : SizeConfig.h(57));
}
