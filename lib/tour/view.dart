import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../route_config.dart';
import 'logic.dart';

class TourPage extends StatelessWidget {
  final logic = Get.put(TourLogic());
  final state = Get.find<TourLogic>().state;

  TourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          TextButton(onPressed: () {Get.toNamed(RouteConfig.travel);}, child: const Text('press'))
        ],
      ),
    );
  }
}
