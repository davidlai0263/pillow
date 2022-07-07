import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class TravelLogic extends GetxController {
  final TravelState state = TravelState();
}

class CustomScrollLobby extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}