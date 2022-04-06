import 'package:map_launcher/map_launcher.dart';

class Site {
  final String name;
  final String address;
  final String qus;
  final List<String> choose;
  final String ans;
  final Coords coords;
  late double distance;
  late bool fail;

  Site(
      {required this.name,
      required this.address,
      required this.qus,
      required this.choose,
      required this.ans,
      required this.coords,
      this.distance = 9999,
      this.fail = false});
}

List<Site> siteMap = [
  Site(
      name: '橘之鄉蜜餞形象館',
      address: '宜蘭市梅洲二路33號\n',
      qus: '宜蘭果農採收當地當季，將最新鮮的金棗送到橘之鄉，請問下列何者為金棗的產季？',
      choose: ['9月~10月', '11月~2月', '3月~5月', '6月~8月'],
      ans: '11月~2月',
      coords: Coords(24.779700827190386, 121.73737709970993)),
  Site(
      name: '菌寶貝博物館',
      address: '宜蘭市梅洲一路22號\n',
      qus: '在菌寶貝博物館中有各式各樣的區域可以參觀或體驗，請問菌寶貝博物館中沒有下列哪一個區域?',
      choose: ['菌史長廊', '海藻生態區', '菌寶貝聯盟彩繪區', '牛樟生態區'],
      ans: '海藻生態區',
      coords: Coords(24.776330226928373, 121.73557099969801)),
  Site(
      name: '錦普觀光果園',
      address: '員山鄉枕山路106之2號\n',
      qus: '錦普觀光果園以栽種水梨為主，但為滿足遊客四季皆可採果的需求，種植了多種果物，下列哪些水果非該果園所栽種的？',
      choose: ['釋迦、鳳梨', '桑葚、檸檬', '芭樂、橘子', '金棗、金桔'],
      ans: '釋迦、鳳梨',
      coords: Coords(24.77442922677484, 121.71931199970724)),
  Site(
      name: '橘子咖啡',
      address: '員山鄉枕山一村19號3樓\n',
      qus: '來到橘子咖啡你看到下列哪個著名地標？',
      choose: ['基隆嶼', '和平島', '石垣島', '龜山島'],
      ans: '龜山島',
      coords: Coords(24.770515510275263, 121.72187556424285)),
  Site(
      name: '波的農場',
      address: '員山鄉枕山路27-58號\n',
      qus: '請問以下何種植物並未出現在波的農場呢？',
      choose: ['牽牛花', '豬籠草', '毛氈苔', '捕蠅草'],
      ans: '牽牛花',
      coords: Coords(24.766929526206386, 121.71347579969992)),
  Site(
      name: '枕頭山休閒農業區',
      address: '員山鄉坡城路18號\n',
      qus: '枕頭山休閒農業區內自然景觀豐富多元，下列何者不是屬於枕頭山休閒農業區內自然景觀？',
      choose: ['山巒', '池埤', '高地', '溪流'],
      ans: '高地',
      coords: Coords(24.77683352854019, 121.70945272211732)),
  Site(
      name: '望龍埤',
      address: '員山鄉枕山村坡城路18-6號\n',
      qus: '望龍埤因湖中水量與當地居民生活息息相關，地方有著以下古諺？',
      choose: ['雨從虎、山從龍', '雨從龍、山從虎', '風從龍、雲從虎', '風從虎、雲從龍'],
      ans: '風從虎、雲從龍',
      coords: Coords(24.7766009598442, 121.69909332587137)),
  Site(
      name: '豬龍寨 波的波可窯烤披薩',
      address: '員山鄉坡城路38號\n',
      qus: '豬籠寨是由什麼改建而成的?',
      choose: ['員工宿舍', '豬舍', '雞舍', '餐廳'],
      ans: '豬舍',
      coords: Coords(24.773902982480593, 121.69935042452838)),
  Site(
      name: '蘭陽老媽媽手工黑豆醬油',
      address: '員山鄉坡城路68號',
      qus: '蘭陽老媽媽的醬油是由什麼製作而成？',
      choose: ['酢', '黑豆', '黃豆', '大豆'],
      ans: '黑豆',
      coords: Coords(24.78053106277951, 121.6962255999825)),
];
