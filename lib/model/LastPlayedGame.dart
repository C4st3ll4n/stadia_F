import 'package:flutterstadia/styleguide/image_asset.dart';

class LastPlayedGame{
  final String name;
  final int hoursPlayed;
  final String imagePath;
  final double gameProgress;

  LastPlayedGame(this.name, this.hoursPlayed, this.gameProgress, this.imagePath);
}

final lastPlayedGames = [
  LastPlayedGame("Assassin's Creed Odyssey",10, 0.20, kGameAssassins),
  LastPlayedGame("Dead Cells",50, 0.80, kGameDeadCells),
  LastPlayedGame("Stardew Valley",90,  0.95, kGameStardew),
  LastPlayedGame( "No Man's Sky", 3, 0.10, kGameNoManSky)
];

final popularWithFriends = [
  kGameFortnite, kGameApex, kGamePubg
];