class DataModel {
  final String title;
  final String imageName;
  final double attack;
  DataModel(
    this.title,
    this.imageName,
    this.attack,
  );
}

List<DataModel> dataList = [
  DataModel("Butterfree", "assets/1.jpg", 300.8),
  DataModel("Pikachu", "assets/2.jpg", 245.2),
  DataModel("Lucario", "assets/3.jpg", 168.2),
  DataModel("Charizard", "assets/4.jpg", 136.7),
];
