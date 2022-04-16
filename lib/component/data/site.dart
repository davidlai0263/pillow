import 'package:map_launcher/map_launcher.dart';

class Site {
  final int index;
  final String name;
  final String address;
  final String qus;
  final List<String> choose;
  final String ans;
  final Coords coords;
  final String intro;
  final String imagePath;
  late double distance;

  Site({
    required this.index,
    required this.name,
    required this.address,
    required this.qus,
    required this.choose,
    required this.ans,
    required this.coords,
    required this.intro,
    required this.imagePath,
    this.distance = 9999,
  });
}

List<Site> siteMap = [
  Site(
      index: 0,
      name: '橘之鄉蜜餞形象館',
      address: '宜蘭市梅洲二路33號\n',
      qus: '宜蘭果農採收當地當季，將最新鮮的金棗送到橘之鄉，請問下列何者為金棗的產季？',
      choose: ['9月~10月', '11月~2月', '3月~5月', '6月~8月'],
      ans: '11月~2月',
      coords: Coords(24.779700827190386, 121.73737709970993),
      intro: '台灣第一家蜜餞觀光工廠，提供導覽解說、教育推廣、體驗活動，並使用在地新鮮的金棗，堅持不添加糖精、色素，讓產品以最自然的口味呈現。',
      imagePath: 'assets/images/candied_fruit.jpg'),
  Site(
      index: 1,
      name: '菌寶貝博物館',
      address: '宜蘭市梅洲一路22號\n',
      qus: '在菌寶貝博物館中有各式各樣的區域可以參觀或體驗，請問菌寶貝博物館中沒有下列哪一個區域?',
      choose: ['菌史長廊', '海藻生態區', '菌寶貝聯盟彩繪區', '牛樟生態區'],
      ans: '海藻生態區',
      coords: Coords(24.776330226928373, 121.73557099969801),
      intro: '台灣第一座以微生物為主題的博物館，能讓遊客了解有關「菌」的專業知識，並且親手體驗與「菌」相關的活動。',
      imagePath: 'assets/images/mushroom_museum.jpg'),
  Site(
      index: 2,
      name: '錦普觀光果園',
      address: '員山鄉枕山路106之2號\n',
      qus: '錦普觀光果園以栽種水梨為主，但為滿足遊客四季皆可採果的需求，種植了多種果物，下列哪些水果非該果園所栽種的？',
      choose: ['釋迦、鳳梨', '桑葚、檸檬', '芭樂、橘子', '金棗、金桔'],
      ans: '釋迦、鳳梨',
      coords: Coords(24.77442922677484, 121.71931199970724),
      intro:
          '園區提供採果活動、生態導覽、高接梨嫁接以及水果蜜餞製作體驗等活動。且為滿足四季均可採果的需求，栽種了水梨、芭樂、金棗、金桔、桑椹等多種水果。',
      imagePath: 'assets/images/orchard.jpg'),
  Site(
      index: 3,
      name: '橘子咖啡',
      address: '員山鄉枕山一村19號3樓\n',
      qus: '來到橘子咖啡你看到下列哪個著名地標？',
      choose: ['基隆嶼', '和平島', '石垣島', '龜山島'],
      ans: '龜山島',
      coords: Coords(24.770515510275263, 121.72187556424285),
      intro: '店內提供簡餐類的餐點，距離宜蘭市區僅不到20分鐘的車程。可以眺望龜山島以及欣賞蘭陽平原美景，是宜蘭的夜景聖地。',
      imagePath: 'assets/images/orange_coffee.jpg'),
  Site(
      index: 4,
      name: '波的農場',
      address: '員山鄉枕山路27-58號\n',
      qus: '請問以下何種植物並未出現在波的農場呢？',
      choose: ['牽牛花', '豬籠草', '毛氈苔', '捕蠅草'],
      ans: '牽牛花',
      coords: Coords(24.766929526206386, 121.71347579969992),
      intro: '全台灣唯一以食蟲植物及雨林為主題的生態農場，農場內種植豬籠草、捕蠅草、毛氈苔等食肉植物，以及用心營造的雨林生態環境。',
      imagePath: 'assets/images/bos_farm.jpg'),
  Site(
      index: 5,
      name: '枕頭山休閒農業區',
      address: '員山鄉坡城路18號\n',
      qus: '枕頭山休閒農業區內自然景觀豐富多元，下列何者不是屬於枕頭山休閒農業區內自然景觀？',
      choose: ['山巒', '池埤', '高地', '溪流'],
      ans: '高地',
      coords: Coords(24.77683352854019, 121.70945272211732),
      intro: '枕頭山休閒農業區內，除了擁有美麗的山巒、池埤、溪流等自然景觀，增加不少教育展示的休閒農園、農舍改建的民宿等旅遊據點。',
      imagePath: 'assets/images/leisure_farm.jpg'),
  Site(
      index: 6,
      name: '望龍埤',
      address: '員山鄉枕山村坡城路18-6號\n',
      qus: '望龍埤因湖中水量與當地居民生活息息相關，地方有著以下古諺？',
      choose: ['雨從虎、山從龍', '雨從龍、山從虎', '風從龍、雲從虎', '風從虎、雲從龍'],
      ans: '風從虎、雲從龍',
      coords: Coords(24.7766009598442, 121.69909332587137),
      intro:
          '「望龍埤」又名軟埤，湖水水位是隨著雨水量升降，因此湖中水量與當地居民生活息息相關，地方耆老則依「風從虎」、「雲從龍」之古諺，而取該湖名為「望龍」。',
      imagePath: 'assets/images/wang_long_pi.jpg'),
  Site(
      index: 7,
      name: '豬龍寨 波的波可窯烤披薩',
      address: '員山鄉坡城路38號\n',
      qus: '豬籠寨是由什麼改建而成的?',
      choose: ['員工宿舍', '豬舍', '雞舍', '餐廳'],
      ans: '豬舍',
      coords: Coords(24.773902982480593, 121.69935042452838),
      intro:
          '宜蘭員山知名景點望龍埤旁，這裡有著三面環山、湖光閃爍的美麗景色，山腳下的豬龍寨原本是廢棄豬舍，在波哥規劃下這裡變身成了別具特色的小店，在這裡也能體驗自己動手做披薩的樂趣。',
      imagePath: 'assets/images/pig_pizza.jpg'),
  Site(
      index: 8,
      name: '蘭陽老媽媽手工黑豆醬油',
      address: '員山鄉坡城路68號',
      qus: '蘭陽老媽媽的醬油是由什麼製作而成？',
      choose: ['酢', '黑豆', '黃豆', '大豆'],
      ans: '黑豆',
      coords: Coords(24.78053106277951, 121.6962255999825),
      intro: '鄰近望龍碑，蘭陽老媽媽手工黑豆醬油，專門做無毒醬油與豆腐乳，以及原製產品。並有餐廳可提供用餐。',
      imagePath: 'assets/images/old_mother_sauce.jpg'),
];
