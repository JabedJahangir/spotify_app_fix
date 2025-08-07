import 'package:get/get.dart';

import '../controllers/listening_party_controller.dart';

class ListeningPartyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListeningPartyController>(
      () => ListeningPartyController(),
    );
  }
}
