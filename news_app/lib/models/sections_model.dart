class SectionsModel {
  final String image;
  final String text;

  const SectionsModel({required this.image, required this.text});

  getCategory(){
    return text;
  }
}
