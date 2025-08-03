import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.02,
        ),
        Text("Albums",style: AppTextStyles.regular24,),

      ],
    );
  }
}
