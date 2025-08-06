import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/data/theme_data.dart';
import 'app/routes/app_pages.dart';

class AppManagement extends StatelessWidget {
  const AppManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          OrientationBuilder(builder: (context, orientation) {
            final designSize = orientation == Orientation.portrait
                ? const Size(375, 812)
                : const Size(812, 375);
            return ScreenUtilInit(
              designSize: designSize,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) => GetMaterialApp(
                title: "Application",
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
                theme: themeData(),
              ),
            );
          }),
    );
  }
}
