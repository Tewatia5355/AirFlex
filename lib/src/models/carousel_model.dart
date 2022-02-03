class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item)).toList();

var carouselsData = [
  "assets/image/indigo.jpg",
  "assets/image/Emirates.jpg",
  "assets/image/spicejet.jpg",
];
