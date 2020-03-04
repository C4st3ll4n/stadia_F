import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterstadia/common/ContentHeadingWidget.dart';
import 'package:flutterstadia/common/LastPlayedGameTileWidget.dart';
import 'package:flutterstadia/common/RoundedImageWidget.dart';
import 'package:flutterstadia/model/Friend.dart';
import 'package:flutterstadia/model/LastPlayedGame.dart';
import 'package:flutterstadia/pages/SecondaryHomePage.dart';
import 'package:flutterstadia/styleguide/colors.dart';
import 'package:flutterstadia/styleguide/image_asset.dart';
import 'package:flutterstadia/styleguide/text_style.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.4;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenWidth * 0.4, 10),
            child: Transform.rotate(
              angle: -0.1,
              child: SvgPicture.asset(
                kLogo,
                height: logoHeight,
                color: kLogoTintColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          color: kPrimaryTextColor,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SecondaryHomePage()));
                        },
                      ),
                      Icon(
                        Icons.search,
                        color: kPrimaryTextColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: <Widget>[
                            RoundedImageWidget(
                              imagePath: kPlayer1,
                              ranking: 39,
                              showRanking: true,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Olá", style: kUsernameTextStyle),
                                    TextSpan(text: "\n"),
                                    TextSpan(
                                        text: "Pedro Henrique",
                                        style: kUsernameTextStyle),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 16, bottom: 16, top: 16),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Horas jogadas",
                                      style: kHoursPlayedLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "300 Horas",
                                  style: kHoursPlayedTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ContentHeadingWidget(heading: "Últimos jogados"),
                      for (var i = 0; i < lastPlayedGames.length; i++)
                        LastPlayedGameTile(
                          lastPlayedGame: lastPlayedGames[i],
                          screenWidth: screenWidth,
                          gameProgress: lastPlayedGames[i].gameProgress,
                        ),
                      ContentHeadingWidget(heading: "Amigos"),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: <Widget>[
                        for(var i=0; i<friends.length;i++)
                          RoundedImageWidget(imagePath: friends[i].imagePath,
                          isOnline: friends[i].isOnline,
                          name: friends[i].name,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
