import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: CustomTextFiled(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          child: Text("Search Result", style: Styles.textStyle18),
        ),
        Expanded(child: ReachResult()),
      ],
    );
  }
}
