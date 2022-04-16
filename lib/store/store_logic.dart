import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillow/lobby/lobby_logic.dart';

import 'store_state.dart';

class StoreLogic extends GetxController {
  final StoreState state = StoreState();
  @override
  Future<void> onInit() async {
    state.initData();
    Get.put(LobbyLogic()).positionStream.pause();
    super.onInit();
  }

  @override
  void onReady() {
    update();
    super.onReady();
  }

  @override
  void onClose() {
    Get.put(LobbyLogic()).positionStream.resume();
    super.onClose();
  }


  void haveChange() {
    state.initData();
    update();
  }

}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
