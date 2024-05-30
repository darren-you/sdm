class MatchMessageVO {
  late String messageId;
  late String sentUserId;
  late String sentUserName;
  late String userAvatar;
}

class TimeMessageVO {
  late String messageId;
  late String userId;
  late String userName;
  late String userAvatar;
  late String time;
}

class TextMessageVO {
  late String messageId;
  late String userId;
  late String userName;
  late String userAvatar;
  late String content;
}

class ImageMessageVO {
  late String messageId;
  late String userId;
  late String userName;
  late String userAvatar;
  late String imageUrl;
}

class VoiceMessageVO {
  late String messageId;
  late String userId;
  late String userName;
  late String userAvatar;
  late String videoUrl;
}

class ChatMessage {
  static buildTestData() {
    final List<dynamic> chatMessageVOList = [];

    //chatMessageVOList.add();
  }
}
