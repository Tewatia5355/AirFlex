class TravlogModel {
  String name;
  String content;
  String place;
  String image;

  TravlogModel(this.name, this.content, this.place, this.image);
}

List<TravlogModel> travlogs = travlogsData
    .map((item) => TravlogModel(item[0], item[1], item[2], item[3]))
    .toList();

var travlogsData = [
  [
    "\"Paris\"",
    "Hey folks! Come and experience Paris through my eyes! Let us explore the beautiful streets of Paris",
    "Paris, France",
    "assets/image/travlog_yogyakarta.png"
  ],
  [
    "\"London\"",
    "Hey folks! Come and experience London through my eyes! Let us explore the beautiful streets of London",
    "London, UK",
    "assets/image/travlog_tokyo.png"
  ],
  [
    "\"Australia\"",
    "Hey folks! Come and experience Australia through my eyes! Let us explore the beautiful streets of Australia",
    "Sydney, Australia",
    "assets/image/travlog_yogyakarta.png"
  ],
  [
    "\"Africa\"",
    "Hey folks! Come and experience Africa through my eyes! Let us explore the beautiful streets of Africa",
    "Lagos, Africa",
    "assets/image/travlog_tokyo.png"
  ],
  [
    "\"Spain\"",
    "Hey folks! Come and experience Spain through my eyes! Let us explore the beautiful streets of Spain",
    "Madrid, Spain",
    "assets/image/travlog_yogyakarta.png"
  ],
];
