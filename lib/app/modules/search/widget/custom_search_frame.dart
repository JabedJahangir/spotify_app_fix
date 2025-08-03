import 'package:flutter/material.dart';

import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';

class CustomSearchFrame extends StatelessWidget {
  const CustomSearchFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,top: 16,bottom: 16),
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundImage: AssetImage(ImagePath.personImage),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .01),
          Text('Cardi B', style: AppTextStyles.light12),
        ],
      ),
    );
  }
}