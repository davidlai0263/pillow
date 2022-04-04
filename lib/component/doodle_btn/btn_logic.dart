import 'package:get/get.dart';

class DoodleBtnWidgetLogic extends GetxController {
  var onTapDown = false.obs;
  void tap() {
    onTapDown.value =! onTapDown.value;
  }
}
