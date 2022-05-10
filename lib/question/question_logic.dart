import 'package:get/get.dart';
import 'package:pillow/lobby/lobby_logic.dart';

class QuestionLogic extends GetxController {
  @override
  void onInit() {
    Get.put(LobbyLogic()).controller.stop();
    Get.put(LobbyLogic()).positionStream.pause();
    super.onInit();
  }

  @override
  void onClose() {
    Get.put(LobbyLogic()).controller.repeat(reverse: true);
    Get.put(LobbyLogic()).positionStream.resume();
    super.onClose();
  }
}
