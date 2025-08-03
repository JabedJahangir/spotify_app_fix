import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../widget/custom_search_frame.dart';

class Artists extends StatelessWidget {
  const Artists({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.02,
          ),
          Text('Artists',style: AppTextStyles.medium24,),
          Wrap(
            runSpacing: 10,
            children: List.generate(12,(index){
              return CustomSearchFrame();
            }),
          )
        ],
      ),
    );
  }
}
