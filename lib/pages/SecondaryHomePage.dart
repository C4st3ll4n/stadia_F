import 'package:flutter/material.dart';
import 'package:flutterstadia/common/ContentHeadingWidget.dart';
import 'package:flutterstadia/common/PopularWithFriendsWidget.dart';
import 'package:flutterstadia/model/LastPlayedGame.dart';
import 'package:flutterstadia/styleguide/colors.dart';
import 'package:flutterstadia/styleguide/image_asset.dart';
import 'package:flutterstadia/styleguide/text_style.dart';

class SecondaryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  kGameSekiro,
                  height: 400,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8
                            , horizontal: 12),
                            child: InkWell(
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onTap: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "NOVO JOGO",
                                  style: kNewGameTextStyle
                                ),
                                TextSpan(text:"\n"),
                                TextSpan(
                                  text: "Sekiro: Shadows Dies Twice",
                                  style: kNewGameNameTextStyle
                                )
                              ]
                            ),
                          ),
                          SizedBox(height: 40,),
                          InkWell(
                            onTap: null,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 32,
                              vertical: 4),
                              decoration: BoxDecoration(
                                gradient: kAppGradient,
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Text(
                                "Jogar",
                                style: kNewGameTextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ContentHeadingWidget(
                    heading: "Popular com seus amigos",
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for(var i = 0; i<popularWithFriends.length;i++)
                          PopularWithFriendsWidget(
                            imagePath: popularWithFriends[i],
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ContentHeadingWidget(heading: "Continue jogando",),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: screenHeight,
                      decoration: BoxDecoration(
                        gradient: kAppGradient,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                child: Image.asset(
                                  lastPlayedGames[0].imagePath,
                                  height: screenHeight * 0.13,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Positioned(
                                left: 25, right: 25,
                                top: 0, bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white
                                  ),
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
                            child: RichText(text:
                            TextSpan(
                              children: [
                                TextSpan(text: lastPlayedGames[0].name,
                                style: kHeadingTwoTextStyle),
                                TextSpan(text:'\n'),
                                TextSpan(text: "${lastPlayedGames[0].hoursPlayed} Horas jogada",
                                style: kBodyTextStyle.copyWith(
                                  color: Colors.white, fontSize: 16, height: 1.5
                                )),
                              ]
                            )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
