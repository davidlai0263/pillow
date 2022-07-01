import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tour_logic.dart';

class TourPage extends StatefulWidget {
  TourPage({Key? key}) : super(key: key);

  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  final logic = Get.put(TourLogic());
  final state = Get.find<TourLogic>().state;

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
          Image.asset('assets/images/tour/錦普觀光果園-採果體驗.jpg')
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TourLogic>();
    super.dispose();
  }
}
