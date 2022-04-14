import 'package:get/get.dart';

class DoodleBtnWidgetLogic extends GetxController {
  bool onTapDown = false;
  void tap() {
    onTapDown = !onTapDown;
    update();
  }


  bool isDelay = false;
  void delay(int? time) async{
    isDelay = true;
    await Future.delayed(Duration(milliseconds: time ?? 600));
    isDelay = false;
  }
}
