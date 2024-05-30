enum ChatMessageTypeEnum {
  match(type: 0),
  time(type: 1),
  text(type: 2),
  img(type: 3),
  voice(type: 4),
  ;

  final int type;

  const ChatMessageTypeEnum({required this.type});
}
