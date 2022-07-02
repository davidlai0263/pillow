import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/component/data/tour.dart';

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
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/background.png',
                width: 1.sw,
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (BuildContext context, int index) {
                      var info = attractionMap[index];
                      return TextButton(
                          onPressed: () {},
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(info.schedule[0].imgUrl,),
                              ),
                              Positioned(
                                bottom: 20.h,
                                child: Text(
                                  info.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ));
                    },
                    itemCount: attractionMap.length),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
