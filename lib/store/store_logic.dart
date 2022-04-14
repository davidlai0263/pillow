import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_state.dart';

class StoreLogic extends GetxController {
  final StoreState state = StoreState();
  @override
  Future<void> onInit() async{
    state.initData();
    super.onInit();
  }
  @override
  void onReady() {
    update();
    super.onReady();
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