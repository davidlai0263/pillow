import 'package:get/get.dart';
import 'package:pillow/lobby/lobby_logic.dart';
import 'question_state.dart';

class QuestionLogic extends GetxController {
  final QuestionState state = QuestionState();

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
