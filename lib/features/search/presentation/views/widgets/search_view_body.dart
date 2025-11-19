import 'package:flutter/material.dart';
import 'package:plupool/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:plupool/features/search/presentation/views/widgets/search_reasult_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustumSearchTextField(),
        const SizedBox(height: 16),
        Text(
          'Search Result',
          //      style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold)
        ),
        const SizedBox(height: 16),
        const Expanded(child: SearchResultListView()),
      ],
    );
  }
}
