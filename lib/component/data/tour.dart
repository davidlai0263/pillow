class ScheduleItem {
  final String title;
  final String time;
  final String intro;
  final String imgUrl;

  ScheduleItem(
      {required this.title,
      required this.time,
      required this.intro,
      required this.imgUrl});
}

class Attraction {
  final String name;
  final String price;
  final List<ScheduleItem> schedule;
  final String suggest;
  final String imgUrl;
  final String coverUrl;

  Attraction(
      {required this.name,
      required this.price,
      required this.schedule,
      required this.suggest,
      required this.imgUrl,
      required this.coverUrl,
      });
}

List<Attraction> attractionMap = [
  Attraction(
      name: 'Hot Pizza',
      price: '799元/每人',
      suggest: '建議2~4人',
      schedule: <ScheduleItem>[
        ScheduleItem(
            title: '菌寶貝博物館',
            time: '10-00',
            intro: '博物館導覽、金棗乾洗手DIY',
            imgUrl: 'assets/images/tour/mushroom_museum_DIY.jpg'),
        ScheduleItem(
            title: '波的波可窯烤PIZZA',
            time: '12-00',
            intro: '窯烤Pizza DIY+飲料',
            imgUrl: 'assets/images/tour/pig_pizza_PIZZADIY2.jpg'),
        ScheduleItem(
            title: '望龍埤生態自由行',
            time: '13-00',
            intro: '自由活動',
            imgUrl: 'assets/images/tour/wang_long_pi_lake.jpg'),
        ScheduleItem(
            title: '枕頭山休閒農業區遊客中心',
            time: '14-00',
            intro: '果樹全利用-果枝永恆筆DIY',
            imgUrl: 'assets/images/tour/leisure_farm_pen.jpg'),
        ScheduleItem(
            title: '賦歸',
            time: '15-30',
            intro: '',
            imgUrl: ''),
      ],
      coverUrl: 'assets/images/tour/mushroom_museum_DIY.jpg',
      imgUrl: 'assets/images/tour/pig_pizza_PIZZADIY.jpg'),
  Attraction(
      name: '桶仔雞',
      price: '899元/每人',
      suggest: '建議2~4人',
      schedule: [
        ScheduleItem(
            title: '波的農場',
            time: '10-00',
            intro: '食蟲植物、雨林生態、深度之旅',
            imgUrl: 'assets/images/tour/bos_farm_plant.jpg'),
        ScheduleItem(
            title: '老媽媽手工醬油',
            time: '12-00',
            intro: '豆腐乳桶仔雞套餐',
            imgUrl: 'assets/images/tour/old_mother_sauce_chicken.jpg'),
        ScheduleItem(
            title: '錦普觀光果園',
            time: '13-30',
            intro: '季節採果體驗',
            imgUrl: 'assets/images/tour/orchard_pick.jpg'),
        ScheduleItem(
            title: '橘之鄉蜜餞形象館',
            time: '15-00',
            intro: '金棗蜜餞DIY',
            imgUrl: 'assets/images/tour/candied_fruit_DIY.jpg'),
        ScheduleItem(
            title: '賦歸',
            time: '16-00',
            intro: '',
            imgUrl: ''),
      ],
      coverUrl: 'assets/images/tour/bos_farm_plant3.jpg',
      imgUrl: 'assets/images/tour/old_mother_sauce_chicken.jpg'),
];
