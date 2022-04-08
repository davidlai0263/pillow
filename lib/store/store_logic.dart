import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_state.dart';

class StoreLogic extends GetxController {
  final StoreState state = StoreState();

}
class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}