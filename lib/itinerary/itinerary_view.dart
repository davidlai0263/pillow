import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'itinerary_logic.dart';

class ItineraryPage extends StatefulWidget {
  ItineraryPage({Key? key}) : super(key: key);

  @override
  _ItineraryPageState createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  final logic = Get.put(ItineraryLogic());
  final state = Get.find<ItineraryLogic>().state;

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
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ItineraryLogic>();
    super.dispose();
  }
}
