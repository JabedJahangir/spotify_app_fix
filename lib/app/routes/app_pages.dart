import 'package:get/get.dart';

import '../modules/album_selection/bindings/album_selection_binding.dart';
import '../modules/album_selection/views/album_selection_view.dart';
import '../modules/all_search/bindings/all_search_binding.dart';
import '../modules/all_search/views/all_search_view.dart';
import '../modules/finish/bindings/finish_binding.dart';
import '../modules/finish/views/finish_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_in_input/bindings/login_in_input_binding.dart';
import '../modules/login_in_input/views/login_in_input_view.dart';
import '../modules/platforms_link/bindings/platforms_link_binding.dart';
import '../modules/platforms_link/views/platforms_link_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/start_now/bindings/start_now_binding.dart';
import '../modules/start_now/views/start_now_view.dart';
import '../modules/user_sign_up/bindings/user_sign_up_binding.dart';
import '../modules/user_sign_up/views/user_sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.START_NOW,
      page: () => const StartNowView(),
      binding: StartNowBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_IN_INPUT,
      page: () => const LoginInInputView(),
      binding: LoginInInputBinding(),
    ),
    GetPage(
      name: _Paths.USER_SIGN_UP,
      page: () => const UserSignUpView(),
      binding: UserSignUpBinding(),
    ),
    GetPage(
      name: _Paths.FINISH,
      page: () => const FinishView(),
      binding: FinishBinding(),
    ),
    GetPage(
      name: _Paths.PLATFORMS_LINK,
      page: () => const PlatformsLinkView(),
      binding: PlatformsLinkBinding(),
    ),
    GetPage(
      name: _Paths.ALBUM_SELECTION,
      page: () => const AlbumSelectionView(),
      binding: AlbumSelectionBinding(),
    ),
    GetPage(
      name: _Paths.ALL_SEARCH,
      page: () => const AllSearchView(),
      binding: AllSearchBinding(),
    ),
  ];
}
