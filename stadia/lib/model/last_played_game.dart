import '../model/popular_with_friends.dart';

import '../config_index.dart';

class LastPlayedGame{
  final String name;
  final int hoursPlayed;
  final String imagePath;
  final double gameProgress;

  const LastPlayedGame({this.name,this.hoursPlayed,this.imagePath,this.gameProgress});
}

/*
assets/games/Dead-Cells.png
assets/games/apex_legends.jpg
assets/games/assassins_odyssey.jpeg
assets/games/fortnite.jpg
assets/games/fortnite_2.png
assets/games/no_ma_sky.jpg
assets/games/pubg.jpeg
assets/games/sekiro.jpg
assets/games/stardew-valley.jpg
*/

final lastPlayedGames = [
  LastPlayedGame(name: "Assassin`s Greed Odyssey",hoursPlayed: 10,gameProgress: 0.20,imagePath: game_assassin),
  LastPlayedGame(name: "Dead Cell",hoursPlayed: 50,gameProgress: 0.80,imagePath: game_dead_cell),
  LastPlayedGame(name: "Stardew Valley",hoursPlayed: 90,gameProgress: 0.95,imagePath: game_stardew_valley),
  LastPlayedGame(name: "No Man`s Sky",hoursPlayed: 3,gameProgress: 0.10,imagePath: game_no_mans_sky),
];

final popularWithFriends = [
  game_fortnite,
  game_apex_legends,
  game_pubg
];