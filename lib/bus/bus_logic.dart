import 'package:get/get.dart';
import 'package:pillow/route_config.dart';

import 'bus_state.dart';

class BusLogic extends GetxController {
  final BusState state = BusState();
  final List sheets = [
    'one','two','three','four','five','six','seven','eight'
  ];
  var busSheet = 'one'.obs;
  var busTime = [true, false];

  void setBusSheet(int id){
    busSheet.value = sheets[id];
  }
  void setBusTime(int index){
    for(int i=0; i<2; i++){
      if(i == index) {
        busTime[i] = true;
      } else {
        busTime[i] = false;
      }
    }
    update();
  }
}
