import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

import '../widget/custom_search_frame.dart';

class All extends StatelessWidget {
  All({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.02,
          ),
          Text('Recent Searches', style: AppTextStyles.regular24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Wrap(
              spacing: 12, // horizontal spacing
              runSpacing: 12, // vertical spacing
              children: List.generate(10, (index) {
                return Chip(
                  label: Text(
                    'wokka wokka',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                    side: BorderSide(color: AppColors.white),
                  ),
                );
              }),
            ),
          ),
          Text('Artists', style: AppTextStyles.regular24),
          SizedBox(
            height: MediaQuery.of(context).size.height * .14,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => CustomSearchFrame(),
            ),
          ),
          Text('Genres', style: AppTextStyles.regular24),
          SizedBox(
            height: MediaQuery.of(context).size.height * .14,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) => CustomSearchFrame(),
            ),
          ),
          Text('Albums', style: AppTextStyles.regular24),
          SizedBox(
            height: MediaQuery.of(context).size.height * .14,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => CustomSearchFrame(),
            ),
          ),
        ],
      ),
    );
  }
}
