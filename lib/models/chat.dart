class Chat {
  String message;
  String doctor;
  String dateTime;
  String image;
  bool isOnline;
  bool hasStory;

  Chat(
      {required this.message,
      required this.doctor,
      required this.dateTime,
      required this.image,
      required this.isOnline,
      required this.hasStory});
}
