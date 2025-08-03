import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class All extends StatelessWidget {
  All({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: AssetImage(ImagePath.personImage),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01),
                      Text('Cardi B',style: AppTextStyles.light12,),
                    ],
                  ),
                ),),
            )

          ],
        ),
      ),
    );
  }
}
