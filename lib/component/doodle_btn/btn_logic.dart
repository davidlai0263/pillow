import 'package:get/get.dart';

class DoodleBtnWidgetLogic extends GetxController {
  bool onTapDown = false;
  void tap() {
    onTapDown = !onTapDown;
    update();
  }
  bool isDelay = false;
  void delay() async{
    isDelay = true;
    await Future.delayed(const Duration(milliseconds: 600));
    isDelay = false;
  }
}
