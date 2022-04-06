import 'package:map_launcher/map_launcher.dart';

const ruleText =
    '本程式中有提供地圖可以查看地點，到指定地點後會自動跳出挑戰及提示，依照提示指示回答問題若正確的話可以獲得轉盤機會隨機獲得積分，積分可累積並於地圖頁面點選兌換，可依照不同的積分兌換優惠或獎品。';

class MapText {
  final String name;
  final String address;
  final Coords coords;
  late double distance;
  MapText(
      {required this.name,
      required this.address,
      required this.coords,
      this.distance = 1000});
}

List<MapText> map = [
  MapText(
      name: '橘之鄉蜜餞形象館',
      address: '宜蘭市梅洲二路33號\n',
      coords: Coords(24.779700827190386, 121.73737709970993)),
  MapText(
      name: '菌寶貝博物館',
      address: '宜蘭市梅洲一路22號\n',
      coords: Coords(24.776330226928373, 121.73557099969801)),
  MapText(
      name: '錦普觀光果園',
      address: '員山鄉枕山路106之2號\n',
      coords: Coords(24.77442922677484, 121.71931199970724)),
  MapText(
      name: '橘子咖啡',
      address: '員山鄉枕山一村19號3樓\n',
      coords: Coords(24.770515510275263, 121.72187556424285)),
  MapText(
      name: '波的農場',
      address: '員山鄉枕山路27-58號\n',
      coords: Coords(24.766929526206386, 121.71347579969992)),
  MapText(
      name: '枕頭山休閒農業區',
      address: '員山鄉坡城路18號\n',
      coords: Coords(24.77683352854019, 121.70945272211732)),
  MapText(
      name: '望龍埤',
      address: '員山鄉枕山村坡城路18-6號\n',
      coords: Coords(24.7766009598442, 121.69909332587137)),
  MapText(
      name: '豬龍寨 波的波可窯烤披薩',
      address: '員山鄉坡城路38號\n',
      coords: Coords(24.773902982480593, 121.69935042452838)),
  MapText(
      name: '蘭陽老媽媽手工黑豆醬油',
      address: '員山鄉坡城路68號',
      coords: Coords(24.78053106277951, 121.6962255999825)),
];
