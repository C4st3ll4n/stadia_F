import 'package:flutter/material.dart';
import 'package:flutterstadia/common/GameProgressWidget.dart';
import 'package:flutterstadia/model/LastPlayedGame.dart';
import 'package:flutterstadia/styleguide/text_style.dart';

class LastPlayedGameTile extends StatelessWidget {
  final LastPlayedGame lastPlayedGame;
  final double screenWidth;
  final double gameProgress;

  const LastPlayedGameTile(
      {Key key, this.lastPlayedGame, this.screenWidth, this.gameProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(
                          lastPlayedGame.imagePath,
                          height: 60,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 8,
                        right: 8,
                        bottom: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: lastPlayedGame.name,
                              style: kHeadingOneTextStyle
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(text: "${lastPlayedGame.hoursPlayed} "
                              "hora(s) jogada(s)",
                          style: kBodyTextStyle)
                        ]
                      ),
                    ),
                  )
                ],
              ),
          ),
          Expanded(child: GameProgressWidget(
            screenWidth:screenWidth,gameProgress: gameProgress,
          ),)
        ],
      ),
    );
  }
}
