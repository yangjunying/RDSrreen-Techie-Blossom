import '../config_index.dart';

class Friend{
  final String name;
  final String imagePath;
  final bool isOnline;

  const Friend({this.name,this.imagePath,this.isOnline});
}

final friends = [
  Friend(name: "Jennie", imagePath: friend_jeenie, isOnline: true),
  Friend(name: "Gena", imagePath: friend_gena, isOnline: true),
  Friend(name: "Michelle", imagePath: friend_michelle, isOnline: true),
  Friend(name: "Trish", imagePath: friend_trish, isOnline: true),
];