import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_coupon_logic.dart';

class MyCouponPage extends StatelessWidget {
  final logic = Get.put(MyCouponLogic());
  final state = Get.find<MyCouponLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
