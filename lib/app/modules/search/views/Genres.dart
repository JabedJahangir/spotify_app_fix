import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../widget/custom_search_frame.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.02,
          ),
          Text('Genres',style: AppTextStyles.regular24,),
          Wrap(
            spacing: 2,
            runSpacing: 10,
            children: List.generate(12,(index){
              return SizedBox(
                  width: 80.w,
                  height: 100.h,
                  child: CustomSearchFrame());
            }),
          )
        ],
      ),
    );
  }
}
