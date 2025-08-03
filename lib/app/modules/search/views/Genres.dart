import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../widget/custom_search_frame.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.02,
        ),
        Text('Genres',style: AppTextStyles.regular24,),
        Wrap(
          runSpacing: 10,
          children: List.generate(12,(index){
            return CustomSearchFrame();
          }),
        )
      ],
    );
  }
}
