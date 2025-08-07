import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/app_colors.dart';
import '../../data/app_text_styles.dart';
import '../../data/image_path.dart';

class CustomAlbumChatRoomPlayer extends StatelessWidget {
  const CustomAlbumChatRoomPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait ? double.infinity : 300.w,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90.w,
                  height: MediaQuery.of(context).orientation == Orientation.portrait ? 90.h : 200.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagePath.rectangle),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Song name here',
                      style: AppTextStyles.medium20,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'Album Name here',
                      style: AppTextStyles.light16,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous_outlined,
                            size: MediaQuery.of(context).size.width*.1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.pause_outlined,
                            size: MediaQuery.of(context).size.width*.1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next_outlined,
                            size: MediaQuery.of(context).size.width*.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  child: Icon(Icons.heart_broken_outlined),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: double.infinity,
                height: 6.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Container(
                      width: 121.w,
                      height: 6.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.88, 0.50),
                          end: Alignment(0.38, 0.50),
                          colors: [
                            const Color(0xFFB359FF),
                            const Color(0x66D8AAFF),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '1:50',
                    style: AppTextStyles.medium12
                ),
                Text(
                    '5:56',
                    style: AppTextStyles.medium12
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
