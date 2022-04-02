import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_logic.dart';

class StorePage extends StatelessWidget {
  final logic = Get.put(StoreLogic());
  final state = Get.find<StoreLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
