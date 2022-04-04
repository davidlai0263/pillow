import 'package:get/get.dart';

class DoodleBtnWidgetLogic extends GetxController {
  bool onTapDown = false;
  void tap() {
    onTapDown = !onTapDown;
    update();
  }
}
