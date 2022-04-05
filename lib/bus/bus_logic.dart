import 'package:get/get.dart';
import 'package:pillow/route_config.dart';

import 'bus_state.dart';

class BusLogic extends GetxController {
  final BusState state = BusState();
  final List sheets = [
    'one','two','three','four','five','six','seven','eight'
  ];
  var busSheet = 'one'.obs;
  var busTime = true;
  var busRoute = true;
  var busID = 0;

  var sheetTitle = '755-去程-上午'.obs;

  void setBusID(int id){
    busID = id;
    setBusSheet(busID);
  }

  void setBusSheet(int id){
    if(id == 0){
      if(busRoute){
        if(busTime){
          busSheet.value = sheets[0];
          sheetTitle.value = '755-去程-上午';
        }else{
          busSheet.value = sheets[1];
          sheetTitle.value = '755-去程-下午';
        }
      }else{
        if(busTime){
          busSheet.value = sheets[2];
          sheetTitle.value = '755-回程-上午';
        }else{
          busSheet.value = sheets[3];
          sheetTitle.value = '755-回程-下午';
        }
      }
    }else{
      if(busRoute){
        if(busTime){
          busSheet.value = sheets[4];
          sheetTitle.value = '綠15-去程-上午';
        }else{
          busSheet.value = sheets[5];
          sheetTitle.value = '綠15-去程-下午';
        }
      }else{
        if(busTime){
          busSheet.value = sheets[6];
          sheetTitle.value = '綠15-回程-上午';
        }else{
          busSheet.value = sheets[7];
          sheetTitle.value = '綠15-回程-下午';
        }
      }
    }
    update();
  }
  void setBusTime(){
    busTime=!busTime;
    setBusSheet(busID);
  }
  void setBusRoute(){
    busRoute=!busRoute;
    setBusSheet(busID);
  }
}
