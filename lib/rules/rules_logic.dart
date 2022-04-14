import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'rules_state.dart';

class RulesLogic extends GetxController {
  final RulesState state = RulesState();

}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}