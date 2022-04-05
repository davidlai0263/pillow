import 'package:map_launcher/map_launcher.dart';

const ruleText =
    '本程式中有提供地圖可以查看地點，到指定地點後會自動跳出挑戰及提示，依照提示指示回答問題若正確的話可以獲得轉盤機會隨機獲得積分，積分可累積並於地圖頁面點選兌換，可依照不同的積分兌換優惠或獎品。';




class MapText {
  final String name;
  final String address;
  final Coords coords;
  MapText({required this.name, required this.address, required this.coords});
}

List<MapText> map = [
  MapText(name: '橘之鄉蜜餞形象館：', address: '宜蘭市梅洲二路33號\n', coords: Coords(24.779808803734046, 121.73738721695392)),
  MapText(name: '菌寶貝博物館：', address: '宜蘭市梅洲一路22號\n', coords: Coords(24.77640271738918, 121.73555029441034)),
  MapText(name: '錦普觀光果園：', address: '員山鄉枕山路106之2號\n', coords: Coords(24.774493274006407, 121.71939904797722)),
  MapText(name: '橘子咖啡：', address: '員山鄉枕山一村19號3樓\n', coords: Coords(24.770486301953973, 121.7217789979351)),
  MapText(name: '波的農場：', address: '員山鄉枕山路27-58號\n', coords: Coords(24.76709515585064, 121.71367964582487)),
  MapText(name: '枕頭山休閒農業區：', address: '員山鄉坡城路18號\n', coords: Coords(24.77712052001219, 121.7094674676997)),
  MapText(name: '望龍埤：', address: '員山鄉枕山村坡城路18-6號\n', coords: Coords(24.77681363114111, 121.69919400812579)),
  MapText(name: '豬龍寨 波的波可窯烤披薩：', address: '員山鄉坡城路38號\n', coords: Coords(24.774123135436902, 121.69944150957194)),
  MapText(name: '蘭陽老媽媽手工黑豆醬油：', address: '員山鄉坡城路68號', coords: Coords(24.780786943500036, 121.69628421884292)),
];