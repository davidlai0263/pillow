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
                      return TextButton(onPressed: () {}, child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(info.schedule[0].imgUrl),
                          ),
                          SizedBox(height: 5.h,),
                          Row(
                            children: [
                              Text(
                                info.name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                info.suggest,
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            info.price,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          SizedBox(height: 10.h,),
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
