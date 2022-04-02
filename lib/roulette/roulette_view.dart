import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'roulette_logic.dart';

class RoulettePage extends StatelessWidget {
  final logic = Get.put(RouletteLogic());
  final state = Get.find<RouletteLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
