import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/instance_manager.dart';
import 'package:tanit_tanit_app/app/modules/search/controllers/search_controller.dart';
import 'package:tanit_tanit_app/app_management.dart';
import 'app/spotify_player_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  Get.put(CustomSearchController());
  Get.put(SpotifyPlayerController());
  runApp(AppManagement());
}
